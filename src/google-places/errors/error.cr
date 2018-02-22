require "json"

module GooglePlaces
  struct Error
    JSON.mapping({
      message: String,
      code:    Int32,
    })
  end
end
