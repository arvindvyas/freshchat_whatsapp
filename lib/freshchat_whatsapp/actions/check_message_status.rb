# frozen_string_literal: true

module FreshchatWhatsapp
  module Actions
    class CheckMessageStatus
      PATH = '/v2/outbound-messages'

      def initialize(client, request_id)
        @client = client
        @request_id = request_id
      end

      def call
        client.get_request "#{PATH}?request_id=#{request_id}"
      end

      private

      attr_reader :client, :request_id
    end
  end
end
