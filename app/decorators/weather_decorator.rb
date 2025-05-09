class WeatherDecorator
  def initialize(raw_data)
    @data = raw_data
  end

  def temperature
    "#{@data.dig('main', 'temp')}°F"
  end

  def high
    "#{@data.dig('main', 'temp_max')}°F"
  end

  def low
    "#{@data.dig('main', 'temp_min')}°F"
  end

  def description
    @data.dig('weather', 0, 'description')&.capitalize
  end

  def city
    @data['name']
  end
end
