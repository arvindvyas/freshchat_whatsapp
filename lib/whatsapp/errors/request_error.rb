# frozen_string_literal: true

module Whatsapp
  module Errors
    class RequestError < StandardError
      attr_reader :response

      def initialize(message, response)
        super message

        @response = response
      end
    end
  end
end
