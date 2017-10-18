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
    actual = Owner.count()
    assert_equal(expected, actual)
  end

  def test_no_adopted()
    owners = Owner.all()
    owner = owners.first
    actual = owner.no_adopted
    assert_equal(2, actual)
  end

  def test_avg_pets()
    pets = []
    owners = Owner.all
    for owner in owners
      if owner.no_adopted > 0
        pets << owner.no_adopted
      end
    end
    sum = (pets.sum)+0.0

    expected = sum/pets.count
    assert_equal(expected, Owner.avg_pets)

  end



end
