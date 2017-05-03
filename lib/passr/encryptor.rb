require 'yaml'
require 'base64'
require 'rbnacl/libsodium'

module Passr
  PATH = File.expand_path('./config/encryptor.yml')

  class Encryptor
    attr_reader :raw_nonce

    def initialize(nonce = nil)
      @secret_key = load_secret_key || generate_secret_key
      @secret_box = create_secret_box
      @raw_nonce = get_raw_nonce(nonce)
    end

    def generate_secret_key
      key = RbNaCl::Random.random_bytes(RbNaCl::SecretBox.key_bytes)
      File.open(PATH, 'w') do |f|
        f.write "---\nSECRET_KEY: #{Base64.encode64(key)}"
      end
      key
    end

    def encrypt(password)
      raw_encryption = secret_box.encrypt(raw_nonce, password)
      Base64.encode64(raw_encryption).chomp
    end

    def decrypt(encrypted_password)
      raw_encryption = Base64.decode64(encrypted_password)
      secret_box.decrypt(raw_nonce, raw_encryption)
    end

    def nonce
      Base64.encode64(raw_nonce).chomp
    end

    private
    attr_reader :secret_key, :secret_box

    def load_secret_key
      begin
        encrypted_key = YAML.load_file(PATH)['SECRET_KEY']
        Base64.decode64(encrypted_key)
      rescue => e
        false
      end
    end

    def get_raw_nonce(nonce)
      if nonce
        Base64.decode64(nonce)
      else
        RbNaCl::Random.random_bytes(secret_box.nonce_bytes)
      end
    end

    def create_secret_box
      RbNaCl::SecretBox.new(secret_key)
    end
  end
end
