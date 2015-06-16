require 'minitest_helper'

class TestGeneratedId < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Rom::GeneratedId::VERSION
  end
end
