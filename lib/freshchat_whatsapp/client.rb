# frozen_string_literal: true

module FreshchatWhatsapp
  class Client
    def initialize(token = nil, token_type = :bearer)
      @base_path = FreshchatWhatsapp.configuration.base_path
      @token = token
      @token_type = token_type
    end

    def request(path, payload = nil)
      full_path = "#{base_path}#{path}"

      conn = Faraday.new(url: full_path, headers: headers)
      response = conn.post { |request| request.body = body(payload) }

      unless response.success?
        raise FreshchatWhatsapp::Errors::RequestError.new('FreshchatWhatsapp API request error.', response)
      end

      JSON.parse(response.body)
    end

    private

    attr_reader :base_path, :token, :token_type

    def token_name
      case token_type
      when :bearer
        'Bearer'
      end
    end

    def headers
      {
        'Authorization' => "#{token_name} #{token}",
        'Content-Type' => 'application/json'
      }
    end

    def body(payload)
      payload && payload.to_json
    end
  end
end
