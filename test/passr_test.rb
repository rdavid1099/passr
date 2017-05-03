require 'test_helper'

class PassrTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Passr::VERSION
  end

  def test_it_generates_encrypted_passwords
    data = Passr.generate length: 20

    assert_equal 20, data[:password].length
    assert data[:password] != data[:encrypted_password]
    assert data[:nonce]
  end

  def test_it_returns_decrypted_password_with_correct_data
    data = Passr.generate length: 20
    decrypted = Passr.reveal password: data[:encrypted_password], nonce: data[:nonce]

    assert_equal data[:password], decrypted
  end

  def test_it_returns_false_if_wrong_info_used_for_reveal
    data = Passr.generate length: 20

    refute Passr.reveal password: data[:encrypted_password], nonce: 1
    refute Passr.reveal password: 'nope', nonce: data[:nonce]    
  end
end
