require 'passr/version'
require 'passr/encryptor'
require 'passr/generator'

# Overall Passr functionality contained within module
module Passr
  # Generate an encrypted password
  #
  # @param [Hash] options options for password generating
  # @option options [Integer] :length length of characters of generated password
  # @option options [String] :nonce nonce to encrypt password using known nonce
  # @return [Hash] data regarding the encrypted generated password
  def self.generate(**options)
    encryptor = Passr::Encryptor.new(options[:nonce])
    generated_password = Passr::Generator.password(options[:length])
    encrypted_password = encryptor.encrypt(generated_password)
    {nonce: encryptor.nonce,
     password: generated_password,
     encrypted_password: encrypted_password}
  end

  # Decrypt and reveal encrypted password
  #
  # @param [Hash] params params of necessary information for decryption
  # @option params [String] :password encrypted password returned from Passr.generate
  # @option params [String] :nonce nonce returned from Passr.generate
  # @return [String] decrypted password
  def self.reveal(**params)
    begin
      encryptor = Passr::Encryptor.new(params[:nonce])
      encryptor.decrypt(params[:password])
    rescue => e
      false
    end
  end
end
