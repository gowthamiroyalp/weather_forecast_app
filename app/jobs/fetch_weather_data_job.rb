class FetchWeatherDataJob < ApplicationJob
  queue_as :default

  def perform(address)
    zip_code = GeocodingService.new(address).zip_code
    return unless zip_code

    weather_service = WeatherService.new(zip_code)
    weather_service.fetch_forecast

::contentReference[oaicite:0]{index=0}
 
