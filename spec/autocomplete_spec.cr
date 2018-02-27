require "./spec_helper"

describe GooglePlaces::Api::Autocomplete do
  it "should return " do
    client = GooglePlaces::Api::Client.new("AIzaSyAduvoZU_b83yb9Ntn-6yuJ79QvIX9anIM", GooglePlaces::Formats::Json, tls = false)
    client.autocomplete("Riga")
  end
end
