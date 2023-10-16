# frozen_string_literal: true

require "freshchat_whatsapp/actions/send_message"

module FreshchatWhatsapp
  class Api
    def initialize
      @base_path = FreshchatWhatsapp.configuration.base_path
    end

  

    def send_message(username, body)
      Actions::SendMessage.new(client, body).call
    end

    def send_hsm_message(username, namespace, element_name, language, params)
      Actions::SendHsmMessage.new(
        client,
        namespace,
        element_name,
        language,
        params
      ).call
    end

    private

    attr_reader :base_path

    def client
      @client ||= FreshchatWhatsapp::Client.new
    end
  end
end
