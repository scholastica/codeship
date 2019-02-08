# Codeship dinghy

<img src="/assets/boat.png" />


This is a minimalistic gem that handles authentication with Codeship's API (v2).

Codeship's API uses tokens, but to get a token, you need to make a basic-auth request. Since the tokens are only
valid for one hour, this gem manages the token for you. You only need to call one method `Codeship.token` and if the token is still when you call `Codeship.token` we'll reuse it.
If the token had already expired, we'll re-authenticate and get a new one.


### Features

* No dependencies! 100% standard lib
* Future proof. Most api clients try to wrap endpoints for you. We're not doing that here.


## Installation

Add this line to your application's Gemfile:

```ruby

gem 'codeship', git: 'https://github.com/scholastica/codeship.git', tag: '1.0.0'
```

And then execute:

    $ bundle


## Configuration

This is for the basic-auth request. Codeship recommends creating an API client user. https://apidocs.codeship.com/v2/authentication/access-and-permissions

```ruby
Codeship.configure do |config|
  config.username = YOUR_USERNAME
  config.password = YOUR_PASSWORD
end
```

## Example

First, make a request w/ the HTTP client of your choice (here using RestClient)

```ruby
token = Codeship.token
resp = RestClient.get "https://api.codeship.com/v2/organizations/7fec57e0-e93e-0133-b53e-76bef8d7b14f/projects", {Authorization: "Bearer #{token}"}
```

Then, parse the respons

```ruby
JSON(resp.body)
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tatums/codeship.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
