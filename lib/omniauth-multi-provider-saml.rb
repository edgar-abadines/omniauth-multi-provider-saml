require 'omniauth/saml/multi_provider/handler'
require 'omniauth/saml/multi_provider/version'

module OmniAuth
  module SAML
    module MultiProvider
      def self.register(builder, options, &dynamic_options_generator)

        handler = OmniAuth::SAML::MultiProvider::Handler.new(&dynamic_options_generator)
        static_options = options.merge(path_prefix: OmniAuth.config.path_prefix)
        builder.provider(:saml, static_options.merge(handler.provider_options))
      end
    end
  end
end
