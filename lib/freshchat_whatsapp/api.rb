# frozen_string_literal: true

require 'freshchat_whatsapp/actions/send_hsm_message'
require 'freshchat_whatsapp/actions/check_message_status'

module FreshchatWhatsapp
  class Api
    def initialize
      @base_path = FreshchatWhatsapp.configuration.base_path
    end

    def send_hsm_message(from_number, to_number, namespace, template_name, language, params)
      Actions::SendHsmMessage.new(
        client,
        from_number,
        to_number,
        namespace,
        template_name,
        language,
        params
      ).call
    end

    def check_message_status(request_id)
      Actions::CheckMessageStatus.new(
        client,
        request_id
      ).call
    end

    private

    attr_reader :base_path

    def client
      @client = FreshchatWhatsapp::Client.new
    end
  end
end
