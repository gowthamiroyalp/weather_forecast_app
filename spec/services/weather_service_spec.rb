require 'rails_helper'

RSpec.describe WeatherService, type: :service do
  let(:zip) { '560001' }
  let(:service) { WeatherService.new(zip) }

  describe '#fetch_forecast' do
    it 'returns weather data' do
      VCR.use_cassette('weather_service_fetch_forecast') do
        forecast = service.fetch_forecast
        expect(forecast).to be_a(Hash)
        expect(forecast['data']).not_to be_empty
      end
    end
  end

  describe '#cached?' do
    it 'returns true if data is cached' do
      service.fetch_forecast
      expect(service.cached?).to be(true)
    end
  end
end
