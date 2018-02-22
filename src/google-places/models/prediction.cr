require "json"

module GooglePlaces
  module Models
    class Prediction
      JSON.mapping({
        description:           String,
        id:                    String,
        matched_substrings:    Array(NamedTuple(length: Int32, offset: Int32)),
        place_id:              String,
        reference:             String,
        structured_formatting: NamedTuple(main_text: String, main_text_matched_substrings: Array(NamedTuple(length: Int32, offset: Int32)), secondary_text: String),
        terms:                 Array(NamedTuple(offset: Int32, value: String)),
        types:                 Array(String),
      })
      def_equals id
    end
  end
end
