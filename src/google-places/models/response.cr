require "json"

module GooglePlaces
  module Models
    class Response
      JSON.mapping({
        predictions: Array(GooglePlaces::Models::Prediction),
        status:      String,
      })
    end
  end
end
