# Passr
[![Gem Version](https://badge.fury.io/rb/passr.png)](https://rubygems.org/gems/passr)
[![Build Status](https://travis-ci.org/rdavid1099/passr.png?branch=master)](https://travis-ci.org/rdavid1099/passr)
[![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/rdavid1099/passr/issues)
[![Coverage Status](https://coveralls.io/repos/rdavid1099/passr/badge.png?branch=master)](https://coveralls.io/r/rdavid1099/passr)

:lock: "If you're able to memorize your passwords, you're doing it wrong."

Passr is a simple Ruby gem handling password generation, encryption and decryption.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'passr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install passr

## Usage

After installing the gem, from the project's root folder run `bundle exec passr install` to generate a secret encryption key. This key will be saved to the file `./config/encryptor.yml` and add it to the project's `.gitignore`. This file must be present for encryption and decryption. Be sure to make a backup of this key. If it is ever moved or deleted from the project, all encrypted passwords will be lost forever.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Contributions are welcome! Be sure to read our [contributing guide](https://github.com/rdavid1099/passr/blob/master/CONTRIBUTING.md) before working on an issue. Bug reports and pull requests are welcome on GitHub at https://github.com/rdavid1099/passr.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
