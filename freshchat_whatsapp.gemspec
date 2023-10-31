# frozen_string_literal: true

require_relative 'lib/freshchat_whatsapp/version'

Gem::Specification.new do |spec|
  spec.name          = 'freshchat_whatsapp'
  spec.version       = FreshchatWhatsapp::VERSION
  spec.authors       = ['Arvind Vyas']
  spec.email         = ['arvindvyas07@gmail.com']

  spec.summary       = 'The Ruby gem enables seamless integration of WhatsApp into Ruby apps via Freshchat, streamlining customer communication and support. It simplifies adding WhatsApp as a channel for enhanced interactions within Ruby-based projects.'
  spec.description   = "The Ruby gem support for Freshchat WhatsApp integration enables seamless communication by leveraging the power of Freshchat within Ruby applications. It allows developers to integrate WhatsApp messaging functionalities into their Ruby-based projects using Freshchat's comprehensive features. This integration simplifies the process of incorporating WhatsApp as a communication channel, offering a convenient solution for Ruby developers to enhance customer "
  spec.homepage      = 'https://github.com/arvindvyas/freshchat_whatsapp'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/arvindvyas/freshchat_whatsapp'
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '>= 2.0', '< 3'
  spec.add_development_dependency 'pry-byebug', '~> 3.6'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
