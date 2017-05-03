require 'test_helper'

class PassrTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Passr::VERSION
  end
end
