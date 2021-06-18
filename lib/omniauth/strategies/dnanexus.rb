require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Dnanexus < OmniAuth::Strategies::OAuth2
      option :name, "dnanexus"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        site: "https://auth.dnanexus.com",
        authorize_url: "/oauth2/authorize",
        token_url: "/oauth2/token"
      }

      option :dnanexus_api_endpoint, "https://api.dnanexus.com"

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { raw_info["id"] }

      info do
        {
          email: raw_info["email"],
          handle: raw_info["handle"],
          first: raw_info["first"],
          middle: raw_info["middle"],
          last: raw_info["last"]
        }
      end

      extra do
        {
          "raw_info" => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.post(
          "#{options.dnanexus_api_endpoint}/#{access_token.params["user_id"]}/describe",
          body: "{}",
          headers: {
            "Content-Type" => "application/json"
          }
        ).parsed
      end
    end
  end
end
