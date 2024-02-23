# frozen_string_literal: true

module FreshchatWhatsapp
  class Client
    def initialize(base_path=nil, token=nil, token_type = :bearer)
      @base_path = base_path ||  FreshchatWhatsapp.configuration.base_path
      @token = token || FreshchatWhatsapp.configuration.api_key
      @token_type = token_type
    end

    def request(path, payload = nil)
      full_path = "#{base_path}#{path}"
      conn = Faraday.new(url: full_path, headers: headers)
      response = conn.post { |request| request.body = body(payload) }
      JSON.parse(response.body)
    end

    def get_request(path, payload = nil)
      full_path = "#{base_path}#{path}"
      conn = Faraday.new(url: full_path, headers: headers)
      response = conn.get { |request| request.body = body(payload) }
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
      payload&.to_json
    end
  end
end
