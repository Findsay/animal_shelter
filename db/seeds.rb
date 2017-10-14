require_relative( '../models/pet')
require_relative( '../models/owner')
require_relative( '../models/pet_owner')


require 'pry-byebug'

Pet.delete_all()
Owner.delete_all()

pet1 = Pet.new({
  'name' => "Molly",
  'gender' => "Female",
  'type' => "Dog",
  'breed' => "Golden Retriever",
  'date_arrived' => 'March 30 2017',
  'adoptable' => "Yes",
  'trained' => "No",
  'picture' =>"url"
})

pet1.save()

pet2 = Pet.new({
    'name' => "Rolo",
    'gender' => "Male",
    'type' => "Dog",
    'breed' => "Corgi",
    'date_arrived' => 'June 25 2016',
    'adoptable' => "No",
    'trained' => "No",
    'picture' =>"url"
})

pet2.save()

pet3 = Pet.new({
    'name' => "Jinx",
    'gender' => "Male",
    'type' => "Cat",
    'breed' => "catbreed",
    'date_arrived' => 'May 25 2014',
    'adoptable' => "Yes",
    'trained' => "Yes",
    'picture' =>"url"
})

pet3.save()

owner1 = Owner.new({
    'name' => "Gerald"
})

owner1.save()

petowner1 = PetOwner.new({
    'owner_id' => owner1.id,
    'pet_id' => pet1.id
})

petowner1.save()

petowner2 = PetOwner.new({
    'owner_id' => owner1.id,
    'pet_id' => pet3.id
})

petowner2.save()





binding.pry
nil
