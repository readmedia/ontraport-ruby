module Ontraport
  BASE_URL = 'https://api.ontraport.com/'
  API_VERSION = '1'

  # --- configuration ---
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  class Configuration
    attr_accessor :api_id
    attr_accessor :api_key
  end
  # --- /end configuration ---

  class APIError < StandardError
  end

  def self.objects_meta
    request_with_authorization :get, endpoint: '/objects/meta'
  end

  private
    def self.request_with_authorization method, endpoint:, data: nil
      resp =  HTTParty.send method, "#{BASE_URL}#{API_VERSION}#{endpoint}",
        headers: { 'Api-Appid' => @configuration.api_id, 'Api-Key' => @configuration.api_key }

      unless resp.response.code.eql? '200'
        raise APIError.new resp.response.body
      end

      resp.parsed_response
    end
end