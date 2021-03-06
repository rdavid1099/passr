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

  def test_it_updates_gitignore
    gitignore = File.expand_path('./.gitignore')
    Passr::Encryptor.update_gitignore

    assert File.read(gitignore).split("\n").include?('/config/encryptor.yml')
  end

  def test_it_creates_encryptor_yaml_and_adds_it_to_gitignore
    encryptor = File.expand_path('./config/encryptor.yml')
    gitignore = File.expand_path('./.gitignore')
    File.delete(encryptor) if File.exists?(encryptor)
    Passr::Encryptor.install

    assert File.read(gitignore).split("\n").include?('/config/encryptor.yml')
    assert File.exists?(encryptor)
  end
  
  def test_it_throws_error_if_already_installed
    exception = assert_raises RuntimeError do
      Passr::Encryptor.install
    end
    
    assert_equal './config/encryptor.yml already exists.', exception.message
  end
  
  def test_load_secret_key_returns_false_if_file_does_not_exist
    encryptor = File.expand_path('./config/encryptor.yml')
    File.delete(encryptor) if File.exists?(encryptor)
    
    refute @encrypt.send(:load_secret_key)
  end
end
