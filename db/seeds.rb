require('date')
require_relative('../models/owner')
require_relative('../models/animal')

owner1 = Owner.new({
  "first_name" => "Tom",
  "last_name" => "Harkness"
  })

owner2 = Owner.new({
  "first_name" => "Karen",
  "last_name" => "Petersen"
  })

owner3 = Owner.new({
  "first_name" => "Jill",
  "last_name" => "Thomson"
  })

  owner1.save
  owner2.save
  owner3.save


animal1 = Animal.new({
  "name" => "Charlie",
  "admission_date" => Date.new(2017, 9, 30),
  "adoptable" => true,
  "owner_id" => owner1.id
  })

animal2 = Animal.new({
    "name" => "Tilly",
    "admission_date" => Date.new(2016, 12, 31),
    "adoptable" => false,
    "owner_id" => owner2.id
    })

animal3 = Animal.new({
      "name" => "Spark",
      "admission_date" => Date.new(2017, 11, 22),
      "adoptable" => true,
      "owner_id" => nil
      })

animal4 = Animal.new({
        "name" => "Fodo",
        "admission_date" => Date.new(2017, 8, 14),
        "adoptable" => false,
        "owner_id" => owner3.id
        })

animal1.save
animal2.save
animal3.save
animal4.save

binding.pry
nil
