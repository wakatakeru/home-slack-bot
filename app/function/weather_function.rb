require 'json'
require 'net/http'
require 'uri'

module WeatherFunction
  LOCALE_CODE = ENV['LOCALE_CODE']
  class << self
    def get_telop
      return get_data['forecasts'][0]['telop']
    end

    def get_description
      return get_data['description']['text']
    end

    private
    
    def get_data
      response = Net::HTTP.get(URI.parse("http://weather.livedoor.com/forecast/webservice/json/v1?city=#{LOCALE_CODE}"))

      return JSON.parse(response)
    end
  end
end
