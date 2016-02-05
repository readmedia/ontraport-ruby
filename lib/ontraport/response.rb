module Ontraport
  class Response
    attr_reader :code, :data, :updates, :notifications, :account_id, :misc 

    def initialize **kwargs
      kwargs.each { |arg,val| self.arg = val }
    end
  end
end