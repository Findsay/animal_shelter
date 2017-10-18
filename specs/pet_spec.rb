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
    expected = 15
    actual = Pet.count_all()
    assert_equal(expected, actual)
  end

  def test_adoption_percentage()
    total = Pet.count_all()+0.0
    adopted = PetOwner.count()
    expected = ((adopted/total)*100).round
    actual = Pet.adoption_percentage
    assert_equal(expected, actual)
  end

  def test_count_type()
    actual = Pet.count_type("Dog")
    assert_equal(9, actual)
    actual = Pet.count_type("Cat")
    assert_equal(3, actual)
    actual = Pet.count_type("Rabbit")
    assert_equal(3, actual)
  end

  def test_pet_percentage()
    total = Pet.count_all + 0.0
    dog_total = Pet.count_type("Dog")
    expected = ((dog_total / total ) * 100 ).round
    assert_equal(expected, Pet.pet_percentage("Dog"))

    total = Pet.count_all + 0.0
    cat_total = Pet.count_type("Cat")
    expected = ((cat_total / total ) * 100 ).round
    assert_equal(expected, Pet.pet_percentage("Cat"))

    total = Pet.count_all + 0.0
    rabbit_total = Pet.count_type("Rabbit")
    expected = ((rabbit_total / total ) * 100 ).round
    assert_equal(expected, Pet.pet_percentage("Rabbit"))
  end




end
