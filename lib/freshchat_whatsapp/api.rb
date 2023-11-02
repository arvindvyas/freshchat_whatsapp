# frozen_string_literal: true

require 'freshchat_whatsapp/actions/send_hsm_message'

module FreshchatWhatsapp
  class Api
    def initialize(from_number)
      @base_path = FreshchatWhatsapp.configuration.base_path
      @from_number = from_number
    end

    def send_hsm_message(phone_number, namespace, template_name, language, params)
      Actions::SendHsmMessage.new(
        client,
        from_number,
        phone_number,
        namespace,
        template_name,
        language,
        params
      ).call
    end

    private

    attr_reader :base_path, :from_number

    def client
      @client = FreshchatWhatsapp::Client.new
    end
  end
end
