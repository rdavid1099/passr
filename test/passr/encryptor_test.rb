require 'test_helper'

class EncryptorTest < Minitest::Test
  def setup
    @encrypt = Passr::Encryptor.new
  end

  def test_it_exists
    assert_instance_of Passr::Encryptor, @encrypt
    refute_nil @encrypt.send(:secret_key)
    refute_nil @encrypt.send(:secret_box)
    refute_nil @encrypt.raw_nonce
    refute_nil @encrypt.nonce
  end

  def test_it_encrypts_data
    assert 'password' != @encrypt.encrypt('password')
  end

  def test_it_decrypts
    encryption = @encrypt.encrypt('password')

    assert_equal 'password', @encrypt.decrypt(encryption)
  end
end
