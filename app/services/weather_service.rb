class WeatherService
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5'

  def initialize(zip)
    @zip = zip
  end

  def fetch_forecast
    Rails.cache.fetch(cache_key, expires_in: 30.minutes) do
      self.class.get('/weather', query: {
        zip: "#{@zip},us",
        units: 'imperial',
        appid: ENV['OPENWEATHERMAP_API_KEY']
      }).parsed_response
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
