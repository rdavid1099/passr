require 'thor'
require 'passr'

module Passr
  class CLI < Thor

    desc 'install Passr in project', 'Creates `./config` if not present and generates secret key and YAML for encryption'
    def install
      begin
        Passr::Encryptor.install
        puts "./config/encryptor.yml successfully created.\nDo NOT remove this file or all encrypted passwords will be lost."
      rescue => e
        puts e
      end
    end
  end
end
