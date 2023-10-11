# frozen_string_literal: true

module FreshchatWhatsapp
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :base_path, :api_key
  end
end
