module Ontraport
  class Response
    # @!attribute [r] code
    #   Response code
    #
    #   @return [String]
    #
    # @!attribute [r] data
    #   A collection containing actual object data returned from the API.
    #
    #   @return [Array<Hash{String=>String,NilClass}>, Hash{String=>String,NilClass}] either a
    #     Hash containing keys for each field belonging to the object type, or an array of those
    #
    # @!attribute [r] updates
    #   @return [Array]
    #
    # @!attribute [r] notifications
    #   @return [Array]
    #
    # @!attribute [r] account_id
    #   Account Id
    #
    #   @return [String] the Id of your ONTRAPORT account
    #
    # @!attribute [r] misc
    #
    # @!attribute [r] name
    #   Name of an object in the schema.
    #
    #   @return [String] name of the object type, used by the +/objects/meta+ call
    #
    # @!attribute [r] fields
    #   Describes the field metadata for an object.
    #
    #   @return [Hash{String=>Hash}] a collection where keys correspond to field names, and
    #     values are a nested +Hash+ containing the following:
    #     - +'alias'+ - Human-readable name of the field
    #     - +'type'+ - type of field. May be one of the following:
    #       - +check+
    #       - +country+
    #       - +fulldate+
    #       - +list+
    #       - +longtext+
    #       - +numeric+
    #       - +price+
    #       - +phone+
    #       - +state+
    #       - +drop+
    #       - +text+
    #       - +timestamp+
    #       - +parent+
    #       - +subscription+
    #       - +email+
    #       - +sms+
    #     - +'options'+ - either an Array or a Hash of options. This is +nil+ unless +type+ is +list+ or +drop+
    #
    # @!attribute [r] schema_object_id
    #   Numeric object identifier for a particular object in the schema.
    #
    #   @return [String]
    attr_reader :code, :data, :updates, :notifications, :account_id, :misc, :name, :fields, :schema_object_id

    def initialize args
      args.each do |key,val|
        instance_variable_set("@#{key}", val) unless val.nil?
      end
    end
  end
end