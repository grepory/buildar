# Buildar

No longer must you write JSON to create Packer build templates... Or duplicate template
content across multiple templates manually. Buildar automates this and makes building
all of your images with packer ezpz lemon squeezy.

## Installation

Add this line to your application's Gemfile:

    gem 'buildar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install buildar

## Usage

TODO: How does it work?

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Testing

TODO: Add information specific to your gem's test suite.

The Rakefile comes with several convenience tasks for running tests as well. By rake task:

  + `spec`: Runs all rspec tests in the spec directory.
  + `yard`: Generates yard documentation.
  + `rubocop`: Runs rubocop.
  + `run_guards`: Runs all guards.

`run_guards` is the one you're most likely to want to run, since it runs all the other test-related tasks.
