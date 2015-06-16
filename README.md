# ROM::GeneratedId

This is a plugin for ROM. It generates an id if it is not present when
creating a tuple.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rom-generated_id'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rom-generated_id

## Usage

```ruby
ROM.setup(:memory)

ROM.relation(:users)
ROM.commands(:users) do
  define(:create) do
    use :generated_id
  end
end

ROM.finalize

ROM.env.command(:users).create.call({name: 'Test Testington'})
user = ROM.env.relation(:users).first
user[:id] # some uuid
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rom-generated_id/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
