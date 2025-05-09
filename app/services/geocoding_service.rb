class GeocodingService
  include HTTParty
  base_uri 'https://api.opencagedata.com/geocode/v1'

  def initialize(address)
    @address = address
  end

  def zip_code
    response = self.class.get('/json', query: {
      key: ENV['OPENCAGE_API_KEY'],
      q: @address
    })
    result = response.parsed_response['results'].first
    result&.dig('components', 'postcode')
  end
end
