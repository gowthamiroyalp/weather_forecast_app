# app/services/weather_service.rb
class WeatherService
  include HTTParty
  base_uri 'https://api.weatherbit.io/v2.0/current'

  def initialize(zip)
    @zip = zip
  end

  def fetch_forecast
    Rails.cache.fetch(cache_key, expires_in: 30.minutes) do
      response = self.class.get('', query: {
        postal_code: @zip,
        country: 'IN',
        key: ENV['WEATHERBIT_API_KEY']
      })
      if response.success? && response.parsed_response['data'].present?
        response.parsed_response
      else
        Rails.logger.warn("Weather API error or empty response: #{response.code} - #{response.body}")
        {}
      end
    end
  end

  def cached?
    Rails.cache.exist?(cache_key)
  end

  private

  def cache_key
    "forecast:#{@zip}"
  end
end
