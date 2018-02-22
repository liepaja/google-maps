require "json"

module GooglePlaces
  struct Errors
    JSON.mapping({
      errors: Array(GooglePlaces::Error),
    })
  end
end
