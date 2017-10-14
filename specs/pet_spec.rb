require 'minitest/autorun'
require 'minitest/rg'

require_relative '../models/pet'

class PetTest < MiniTest::Test

  def setup()
    options = ({
      'name' => "Molly",
      'gender' => "Female"
      'type' => "Dog",
      'breed' => "Golden Retriever",
      'date' => "1/1/2017",
      'adoptable' => true,
      'trained' => true,
      'owner_id' => 1
      'picture' =>"url"
    })

    @pet1 = Pet.new(options)

  end




end
