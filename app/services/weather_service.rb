class WeatherService
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5'

  def initialize(zip)
    @zip = zip
  end

  def fetch_forecast
    binding.pry
    # http://api.openweathermap.org/geo/1.0/direct?q=London&limit=5&appid={API key}

    Rails.cache.fetch(cache_key, expires_in: 30.minutes) do
      self.class.get('/weather', query: {
        zip: "#{@zip},us",  # append country code here
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
