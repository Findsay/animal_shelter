require_relative( '../models/pet')
require_relative( '../models/owner')


require 'pry-byebug'

Pet.delete_all()
Owner.delete_all()

pet1 = Pet.new({
  'name' => "Molly",
  'gender' => "Female",
  'type' => "Dog",
  'breed' => "Golden Retriever",
  'date_arrived' => 'March 30 2017',
  'adoptable' => true,
  'trained' => true,
  'picture' =>"url"
  })

pet1.save()

pet2 = Pet.new({
  'name' => "Rolo",
  'gender' => "Male",
  'type' => "Dog",
  'breed' => "Corgi",
  'date_arrived' => 'June 25 2016',
  'adoptable' => true,
  'trained' => false,
  'picture' =>"url"
  })

  pet2.save()

owner1 = Owner.new({
  'name' => "Gerald"
  })

owner1.save()




binding.pry
nil
