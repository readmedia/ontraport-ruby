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
    unless object.class.eql? Symbol
      raise ArgumentError.new "Must provide a symbol for the object name."
    end

    unless metadata = objects_meta['data']&.find{ |k, v| v['name'].downcase.to_sym.eql? object }
      raise ObjectNotFoundError.new "No object matching #{object.inspect} could be found."
    end

    metadata.second.update 'object_id' => metadata.first
  end

  def self.clear_describe_cache!
    @objects_meta_cache = nil
  end

  def self.get_object object, id
    objects_call :get, object, endpoint: '/object', data: { id: id }
  end

  def self.get_objects object, params={}
    objects_call :get, object, endpoint: '/objects', data: params
  end

  def self.save_or_update object, params
    objects_call :post, object, endpoint: '/objects/saveorupdate', data: params
  end

  def self.update_object object, id, params
    objects_call :put, object, endpoint: '/objects', data: params.update(id: id)
  end

  private
    def self.request_with_authentication method, endpoint:, data: nil
      data_param = method.eql?(:get) ? :query : :body

      args = [method, "#{BASE_URL}#{API_VERSION}#{endpoint}"]
      kwargs = {
        :headers => { 'Api-Appid' => @configuration.api_id, 'Api-Key' => @configuration.api_key },
        data_param => data
      }

      response = HTTParty.send *args, **kwargs

      unless response.code.eql? 200
        raise APIError.new response.body
      end

      response.parsed_response
    end

    def self.objects_call method, object, endpoint:, data: {}
      metadata = describe object
      data.update 'objectID' => metadata['object_id']

      request_with_authentication method, endpoint: endpoint, data: data
    end

    def self.objects_meta
      @objects_meta_cache ||= request_with_authentication :get, endpoint: '/objects/meta'
    end
end