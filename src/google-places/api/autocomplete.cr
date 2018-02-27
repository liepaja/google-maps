module GooglePlaces
  module Api
    module Autocomplete
      Path = "/maps/api/place/autocomplete/"

      def autocomplete(input : String, options = {} of String => String)
        options = options.merge({"input" => input})
        response = get(Path, options)
        GooglePlaces::Models::Response.from_json(response).to_json
      end
    end
  end
end
