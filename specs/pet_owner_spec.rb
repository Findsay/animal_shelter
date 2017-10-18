require 'minitest/autorun'
require 'minitest/rg'

require_relative "../db/sql_runner"
require_relative '../models/pet'
require_relative "../models/owner"
require_relative "../models/pet_owner"

class PetTest < MiniTest::Test

  def setup()

  end

  def test_count
    expected = 5
    actual = PetOwner.count()
    assert_equal(expected, actual)
  end
end
