# Passr
[![Gem Version](https://badge.fury.io/rb/passr.png)](https://rubygems.org/gems/passr)
[![Build Status](https://travis-ci.org/rdavid1099/passr.png?branch=master)](https://travis-ci.org/rdavid1099/passr)
[![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/rdavid1099/passr/issues)
[![Coverage Status](https://coveralls.io/repos/github/rdavid1099/passr/badge.svg?branch=master)](https://coveralls.io/github/rdavid1099/passr?branch=master

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

After installing the gem, from the project's root folder run `bundle exec passr install` to generate a secret encryption key. This key will be saved to the file `./config/encryptor.yml` and add it to the project's `.gitignore`. This file must be present for encryption and decryption. Be sure to make a backup of this key. If it is ever moved or deleted from the project, all encrypted passwords will be lost forever.

## Usage

### Generating Encrypted Passwords

Using Passr is a simple as requiring the gem and calling `Passr.generate`. The method will return a Hash containing the `:password`, `:nonce`, and `:encrypted_password`.
- `:password` is the unencrypted generated password.
- `:encrypted_password` is the encrypted generated password using the secret key stored in `./config/encryption.yml` and the nonce.
- `:nonce` is the nonce used to create the encrypted password. The nonce must be saved and provided for decryption.

`Passr.generate` has multiple options that can be passed in as arguments to customize the generated passwords.
- `:length` will create a generated password with the given number of characters. Length defaults to 15 characters and must be under 40 characters.
- `:nonce` will create an encryption of the generated password using the given nonce. It will throw an error if the nonce is not compatible with the secret key saved in `./config/encryption.yml`.

```ruby
require 'passr'

Passr.generate
# => {:password => "$4!~j9t=18%f+@I",
#     :encrypted_password => "XnShJLuUyArMMkMQNeQismHLukTeRa1LMJHRc39Avw==",
#     :nonce => "ee/1Z2YlXVkqmPn1CRPtukTzMa4fNh99"}

Passr.generate(length: 20,
               nonce: "ee/1Z2YlXVkqmPn1CRPtukTzMa4fNh99")
# => {:nonce => "ee/1Z2YlXVkqmPn1CRPtukTzMa4fNh99",
#     :password => "l~qy5g!j78=ndx2614N@",
#     :encrypted_password => "ZYrISzJiNpn2JpB+FrEgeymB6kOBG/gcNpHJezB4xPV3eXjV"}
```

### Decrypting Passwords

Simply decrypt any generated passwords calling `Passr.reveal` and passing in the encrypted password and the nonce used to encrypt the password as arguments and it will return the decrypted password as a String.

```ruby
require 'passr'

Passr.generate
# => {:password => "$4!~j9t=18%f+@I",
#     :encrypted_password => "XnShJLuUyArMMkMQNeQismHLukTeRa1LMJHRc39Avw==",
#     :nonce => "ee/1Z2YlXVkqmPn1CRPtukTzMa4fNh99"}

Passr.reveal(password: "XnShJLuUyArMMkMQNeQismHLukTeRa1LMJHRc39Avw==",
             nonce: "ee/1Z2YlXVkqmPn1CRPtukTzMa4fNh99")
# => "$4!~j9t=18%f+@I"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Contributions are welcome! Be sure to read our [contributing guide](https://github.com/rdavid1099/passr/blob/master/CONTRIBUTING.md) before working on an issue. Bug reports and pull requests are welcome on GitHub at https://github.com/rdavid1099/passr.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
