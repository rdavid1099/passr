require 'test_helper'

class GeneratorTest < Minitest::Test
  def test_it_exists
    assert_instance_of Passr::Generator, Passr::Generator.new
  end

  def test_it_generates_password_of_default_length_15
    generated = Passr::Generator.password

    assert_equal 15, generated.length
    assert Passr::Generator.is_sanitary?(generated)
    assert Passr::Generator.is_all_unique_characters?(generated)
  end

  def test_sanitary_and_unique_characters_fail_if_bad_password
    refute Passr::Generator.is_sanitary?('bdpaswor')
    refute Passr::Generator.is_all_unique_characters?('nooooo')
  end

  def test_it_generates_password_of_given_length
    generated = Passr::Generator.password(25)

    assert_equal 25, generated.length
  end

  def test_length_over_39_is_coverted_to_15
    generated = Passr::Generator.password(55)

    assert_equal 15, generated.length
  end
end
