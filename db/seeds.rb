require_relative( '../models/pet')


require 'pry-byebug'


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
