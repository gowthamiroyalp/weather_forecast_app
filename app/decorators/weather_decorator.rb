class WeatherDecorator
  def initialize(raw_data)
    @data = raw_data
    @weather_info = @data.dig('data', 0) || {}
  end

  def temperature
    "#{@weather_info['temp']}°C" if @weather_info['temp']
  end

  def description
    @weather_info.dig('weather', 'description')&.capitalize
  end

  def city
    @weather_info['city_name']
  end
end
