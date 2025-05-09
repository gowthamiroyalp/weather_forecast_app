class HomeController < ApplicationController
  def index
    return unless params[:address].present?

    @address = params[:address]
    zip_code = GeocodingService.new(@address).zip_code

    if zip_code
      weather_service = WeatherService.new(zip_code)
      raw_data = weather_service.fetch_forecast
      @forecast = WeatherDecorator.new(raw_data)
      @from_cache = weather_service.cached?
    else
      flash.now[:alert] = "Could not find ZIP code for the address."
    end
  end
end
