require 'minitest_helper'
require 'rom/memory'

class TestGeneratedId < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ROM::GeneratedId::VERSION
  end

  def setup
    ROM.setup(:memory)

    ROM.relation(:users)
    ROM.commands(:users) do
      define(:create) do
        use :generated_id
      end
    end

    ROM.finalize
  end

  def test_sets_the_id_on_create
    ROM.env.command(:users).create.call({name: 'Test Testington'})

    assert_equal 1, ROM.env.relation(:users).to_a.length
    user = ROM.env.relation(:users).first
    refute_nil user[:id]
    assert_equal 'Test Testington', user[:name]
  end

  def test_does_not_set_id_if_given
    ROM.env.command(:users).create.call({id: 12, name: 'Test Testington'})

    assert_equal 1, ROM.env.relation(:users).to_a.length
    user = ROM.env.relation(:users).first
    assert_equal 12, user[:id]
    assert_equal 'Test Testington', user[:name]
  end
end
