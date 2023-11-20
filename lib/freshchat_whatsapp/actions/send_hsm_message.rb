# frozen_string_literal: true

module FreshchatWhatsapp
  module Actions
    class SendHsmMessage
      PATH = '/v2/outbound-messages/whatsapp'

      def initialize(client, from_number, wtsapp_phone_number, namespace, template_name, language, params)
        @from_number = from_number
        @phone_number = wtsapp_phone_number
        @namespace = namespace
        @template_name = template_name
        @language = language
        @params = params
        @client = client
      end

      def call
        client.request PATH, payload
      end

      private

      attr_reader :client, :wtsapp_phone_number, :namespace, :template_name, :language, :params

      def payload
        payload = {
          'from': {
            'phone_number': @from_number
          },
          'to': [
            {
              'phone_number': @phone_number
            }
          ],
          'data': {
            'message_template': {
              'storage': 'conversation',
              'namespace': @namespace,
              'template_name': @template_name,
              'language': {
                'policy': 'deterministic',
                'code': 'en'
              }
            }
          }
        }

        payload[:data][:message_template].merge!(params)
        payload
      end
    end
  end
end
