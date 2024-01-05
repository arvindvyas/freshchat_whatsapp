# frozen_string_literal: true

require 'freshchat_whatsapp/actions/send_hsm_message'
require 'freshchat_whatsapp/actions/check_message_status'

module FreshchatWhatsapp
  class Api
    def initialize(base_path=nil,token=nil)
      fresh_chat_base_path = base_path || FreshchatWhatsapp.configuration.base_path
      @base_path = fresh_chat_base_path
      @token = token
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
      @client = FreshchatWhatsapp::Client.new(@base_path, @token)
    end
  end
end
