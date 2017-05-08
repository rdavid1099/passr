require 'test_helper'

class StringExtensionTest < Minitest::Test
  def test_it_adds_a_special_character_to_string
    refute "password".add_special!.scan(/[!@#$%^&*()]/).empty?
  end

  def test_it_adds_a_special_character_to_string
    refute "password".add_number!.scan(/[0-9]/).empty?
  end

  def test_it_adds_a_special_character_to_string
    refute "password".add_capital_letter!.scan(/[A-Z]/).empty?
  end
end