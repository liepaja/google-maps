# google-places

Crystal wrapper around the Google Places API

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  google-places:
    github: liepaja/google-places
```

## Usage

```crystal
require "google-places"
```

## `Place Autocomplete`
### `https://developers.google.com/places/web-service/autocomplete`

Default options
```crystal
#GooglePlaces::Api::Client.new(api_key : String, @format = Formats::Json, tls = true)
client = GooglePlaces::Api::Client.new("AIzaSyAdutrZU_b83yb4Otn-6yuJ79QvFR9anIM") # Xml currently not supported 

response = client.autocomplete("Riga")
response.status # Ok
response.predictions[0].description # Riga, Latvia
```

Custom options
```crystal
client = GooglePlaces::Api::Client.new("AIzaSyAdutrZU_b83yb4Otn-6yuJ79QvFR9anIM")

response = client.autocomplete("Riga", {"types" => "(cities)", "language" => "nl"})
response.status # Ok
response.predictions[0].description # Riga, Letland
```

OpenSSL workaround 
```crystal
# Some users face OpenSSL issues, in this case tls can be made insecure
client = GooglePlaces::Api::Client.new("AIzaSyAdutrZU_b83yb4Otn-6yuJ79QvFR9anIM", GooglePlaces::Formats::Json, tls = false)
```

## Development

- Expand api
- Write tests
- Solve OpenSSL issues

## Contributing

1. Fork it ( https://github.com/liepaja/google-places/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [liepaja](https://github.com/liepaja) Ernests Elksnis - creator, maintainer
