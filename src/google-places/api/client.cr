module GooglePlaces
  module Api
    class Client
      Host = "maps.googleapis.com"
      include GooglePlaces::Api::Autocomplete

      def initialize(@api_key : String, @format = Formats::Json, tls = true)
        if !tls
          tls = OpenSSL::SSL::Context::Client.insecure
        end
        @http_client = HTTP::Client.new(Host, tls: tls)
      end

      def get(path : String, params = {} of String => String)
        params = params.merge({"key" => @api_key})
        format = @format.to_s.downcase
        path += "#{format}?#{to_query_string(params)}" unless params.empty?

        response = @http_client.get(path)
        handle_response(response)
      end

      private def handle_response(response : HTTP::Client::Response)
        case response.status_code
        when 200..299
          response.body
        when 400..499
          message = GooglePlaces::Errors.from_json(response.body).errors.first.message
          raise GooglePlaces::Errors::ClientError.new(message)
        when 500
          raise GooglePlaces::Errors::ServerError.new("Internal Server Error")
        when 502
          raise GooglePlaces::Errors::ServerError.new("Bad Gateway")
        when 503
          raise GooglePlaces::Errors::ServerError.new("Service Unavailable")
        when 504
          raise GooglePlaces::Errors::ServerError.new("Gateway Timeout")
        else
          ""
        end
      end

      private def to_query_string(hash : Hash)
        HTTP::Params.build do |form_builder|
          hash.each do |key, value|
            form_builder.add(key, value)
          end
        end
      end
    end
  end
end
