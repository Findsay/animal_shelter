require_relative( '../models/pet')
require_relative( '../models/owner')
require_relative( '../models/pet_owner')


require 'pry-byebug'

PetOwner.delete_all()
Pet.delete_all()
Owner.delete_all()

owner1 = Owner.new({
    'name' => "Gerald",
    'email' => "gerald@gmail.com",
    'mobile' => "07711223344"
})
owner1.save()

owner2 = Owner.new({
    'name' => "Helen",
    'email' => "helen@gmail.com",
    'mobile' => "07722334455"
})
owner2.save()

owner3 = Owner.new({
    'name' => "Jean",
    'email' => "jean@gmail.com",
    'mobile' => "07733557788"
})
owner3.save()

owner4 = Owner.new({
    'name' => "Lisa",
    'email' => "lisa@gmail.com",
    'mobile' => "07734597688"
})
owner4.save()

owner5 = Owner.new({
    'name' => "Grant",
    'email' => "grant@gmail.com",
    'mobile' => "07734697691"
})
owner5.save()


pet1 = Pet.new({
  'name' => "Molly",
  'gender' => "Female",
  'type' => "Dog",
  'breed' => "Golden Retriever",
  'date_arrived' => 'March 30 2017',
  'adoptable' => "Yes",
  'trained' => "No",
  'picture' =>"images/buddy.jpg"
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
    'picture' =>"images/rolo.jpg"
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
    'picture' =>"images/jinx.jpg"
})

pet3.save()

pet4 = Pet.new({
    'name' => "Cooper",
    'gender' => "Male",
    'type' => "Dog",
    'breed' => "German Shepherd",
    'date_arrived' => 'July 25 2015',
    'adoptable' => "Yes",
    'trained' => "Yes",
    'picture' =>"images/cooper.jpg"
})

pet4.save()

pet5 = Pet.new({
    'name' => "George",
    'gender' => "Male",
    'type' => "Rabbit",
    'breed' => "American Sable",
    'date_arrived' => 'August 18 2017',
    'adoptable' => "Yes",
    'trained' => "Yes",
    'picture' =>"images/george.jpg"
})

pet5.save()

pet6 = Pet.new({
    'name' => "Leo",
    'gender' => "Male",
    'type' => "Dog",
    'breed' => "Chow Chow",
    'date_arrived' => 'March 09 2016',
    'adoptable' => "Yes",
    'trained' => "Yes",
    'picture' =>"images/leo.jpg"
})

pet6.save()

pet7 = Pet.new({
    'name' => "Mr Cat",
    'gender' => "Male",
    'type' => "Cat",
    'breed' => "Tabby",
    'date_arrived' => '11 October 2016',
    'adoptable' => "Yes",
    'trained' => "No",
    'picture' =>"images/mr_cat.jpg"
})

pet7.save()

pet8 = Pet.new({
    'name' => "Peterina",
    'gender' => "Female",
    'type' => "Rabbit",
    'breed' => "Long Hair",
    'date_arrived' => '16 December 2016',
    'adoptable' => "Yes",
    'trained' => "No",
    'picture' =>"images/peter.jpg"
})

pet8.save()

pet9 = Pet.new({
    'name' => "Sasha",
    'gender' => "Female",
    'type' => "Dog",
    'breed' => "Husky",
    'date_arrived' => 'April 15 2017',
    'adoptable' => "Yes",
    'trained' => "No",
    'picture' =>"images/sasha.jpg"
})

pet9.save()

pet10 = Pet.new({
    'name' => "Spot",
    'gender' => "Female",
    'type' => "Rabbit",
    'breed' => "Spotty",
    'date_arrived' => 'March 23 2017',
    'adoptable' => "Yes",
    'trained' => "No",
    'picture' =>"images/spot.jpg"
})

pet10.save()

pet11 = Pet.new({
    'name' => "Rugcat",
    'gender' => "Female",
    'type' => "Cat",
    'breed' => "Mixed",
    'date_arrived' => 'September 21 2017',
    'adoptable' => "Yes",
    'trained' => "Yes",
    'picture' =>"images/tess.jpg"
})

pet11.save()

pet12 = Pet.new({
    'name' => "Wellington",
    'gender' => "Male",
    'type' => "Dog",
    'breed' => "English Sheepdog",
    'date_arrived' => 'February 06 2017',
    'adoptable' => "Yes",
    'trained' => "Yes",
    'picture' =>"images/wellington.jpg"
})

pet12.save()

pet13 = Pet.new({
    'name' => "Luther",
    'gender' => "Male",
    'type' => "Dog",
    'breed' => "Labrador",
    'date_arrived' => 'July 23 2016',
    'adoptable' => "Yes",
    'trained' => "Yes",
    'picture' =>"images/luther.jpg"
})

pet13.save()

pet14 = Pet.new({
    'name' => "Fred",
    'gender' => "Male",
    'type' => "Dog",
    'breed' => "Bulldog",
    'date_arrived' => 'November 18 2016',
    'adoptable' => "Yes",
    'trained' => "Yes",
    'picture' =>"images/fred.jpg"
})
pet14.save()

pet15 = Pet.new({
    'name' => "Alfie",
    'gender' => "Male",
    'type' => "Dog",
    'breed' => "Jack Russell",
    'date_arrived' => 'October 10 2017',
    'adoptable' => "Yes",
    'trained' => "No",
    'picture' =>"images/alfie.jpg"
})

pet15.save()

petowner1 = PetOwner.new({
    'owner_id' => owner1.id,
    'pet_id' => pet1.id
})
petowner1.save()

petowner2 = PetOwner.new({
    'owner_id' => owner1.id,
    'pet_id' => pet8.id
})

petowner2.save()

petowner3 = PetOwner.new({
    'owner_id' => owner4.id,
    'pet_id' => pet4.id
})
petowner3.save()

petowner4 = PetOwner.new({
    'owner_id' => owner5.id,
    'pet_id' => pet3.id
})
petowner4.save()

petowner5 = PetOwner.new({
    'owner_id' => owner5.id,
    'pet_id' => pet7.id
})
petowner5.save()

binding.pry
nil
