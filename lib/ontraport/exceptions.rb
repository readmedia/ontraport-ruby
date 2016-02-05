module Ontraport
  # Used when the API itself returns with an HTTP status code other than +200+
  class APIError < StandardError; end

  # Used by the describe call when attempting to look up an object type
  # that cannot be found in the object metadata
  class ObjectNotFoundError < StandardError; end
end