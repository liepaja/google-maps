module GooglePlaces
  module Api
    module Autocomplete
      Path = "/maps/api/place/autocomplete/"

      def autocomplete(input : String, options = {} of String => String)
        options = options.merge({"input" => input})
        response = get(Path, options)
        response = GooglePlaces::Models::Response.from_json(response)
        if response.status != "OK"
          raise "Response from Google not OK"
        end
        response.predictions
      end
    end
  end
end
