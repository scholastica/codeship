# Codeship


This is a minimalistic gem that handles authenticating againsts Codeship's API (v2).

Codeship requires you to uses basic-auth to acquire a short lived token. 


### Features

* No dependencies!
* Future proof


## Installation

Add this line to your application's Gemfile:

```ruby

gem 'codeship', git: 'https://github.com/scholastica/codeship.git', tag: '1.0.0'
```

And then execute:

    $ bundle


## Configuration

Codeship.configure do |config|
  config.username = YOUR_USERNAME
  config.password = YOUR_PASSWORD
end


## Example

First, Make a request w/ the HTTP client of your choice (here using RestClient)

    resp = RestClient.get "https://api.codeship.com/v2/organizations/7fec57e0-e93e-0133-b53e-76bef8d7b14f/projects", {Authorization: "Bearer #{Codeship.token}"}

Then, parse the respons

    projects = JSON(resp.body)



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tatums/codeship.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
