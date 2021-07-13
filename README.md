<h1 align="center">
  OmniAuth::DNAnexus
</h1>

<p align="center">
  <a target="_blank" rel="noopener noreferrer" href="https://twitter.com/MikeRogers0">
    <img src="https://img.shields.io/twitter/follow/MikeRogers0?label=Follow%20%40MikeRogers0%20For%20Updates&style=social" alt="Follow @MikeRogers on Twitter" style="max-width:100%;">
  </a>
  <a target="_blank" rel="noopener noreferrer" href="https://badge.fury.io/rb/omniauth-dnanexus">
    <img src="https://badge.fury.io/rb/omniauth-dnanexus.svg" alt="Gem Version" style="max-width:100%;">
  </a>
  <a target="_blank" rel="noopener noreferrer" href="https://github.com/MikeRogers0/omniauth-dnanexus/actions/workflows/ci.yml">
    <img src="https://github.com/MikeRogers0/omniauth-dnanexus/actions/workflows/ci.yml/badge.svg" alt="CI Passing" style="max-width:100%;">
  </a>
</p>

<p align="center">
OmniAuth strategy for <a target="_blank" rel="noopener noreferrer"  href="https://documentation.dnanexus.com/developer/api/authentication">DNAnexus</a>
</p>

## Installation

```bash
$ bundle add omniauth-dnanexus
```
## Usage

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :dnanexus, ENV["DNANEXUS_CLIENT_ID"], ENV["DNANEXUS_CLIENT_SECRET"], {
    dnanexus_api_endpoint: "https://api.dnanexus.com",
    client_options: {
      site: "https://auth.dnanexus.com",
      authorize_url: "/oauth2/authorize",
      token_url: "/oauth2/token"
    }
  }
end
```

### DNAnexus Staging

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :dnanexus, ENV["DNANEXUS_CLIENT_ID"], ENV["DNANEXUS_CLIENT_SECRET"], {
    dnanexus_api_endpoint: "https://stagingapi.dnanexus.com",
    client_options: {
      site: "https://stagingauth.dnanexus.com"
    }
  }
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MikeRogers0/omniauth-dnanexus

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
