module Ontraport
  BASE_URL = 'https://api.ontraport.com/'
  API_VERSION = '1'

  attr_accessor :objects_meta_cache

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

  class APIError < StandardError
  end

  class ObjectNotFoundError < StandardError
  end

  def self.describe object
    unless metadata = objects_meta['data']&.find{ |k, v| v['name'].downcase.to_sym.eql? object }
      raise ObjectNotFoundError.new "No object matching #{object.inspect} could be found"
    end

    metadata.second.update 'object_id' => metadata.first
  end

  # --- get calls ---
  def self.objects_meta
    @objects_meta_cache ||= request_with_authentication :get, endpoint: '/objects/meta'
  end

  # --- post calls ---
  def self.save_or_update object, params
    metadata = describe object

    params.update 'objectID' => metadata['object_id']
    request_with_authentication :post, endpoint: '/objects/saveorupdate', data: params
  end

  # --- put calls ---
  # --- delete calls ---

  private
    def self.request_with_authentication method, endpoint:, data: nil
      data_param = method.in?([:post, :put]) ? :body : :query

      args = [method, "#{BASE_URL}#{API_VERSION}#{endpoint}"]
      kwargs = {
        :headers => { 'Api-Appid' => @configuration.api_id, 'Api-Key' => @configuration.api_key },
        data_param => data
      }

      response =  HTTParty.send *args, **kwargs

      unless response.code.eql? 200
        raise APIError.new response.body
      end

      response.parsed_response
    end
end