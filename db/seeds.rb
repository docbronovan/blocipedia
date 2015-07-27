# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

#create user my 

# Create an admin user
<<<<<<< HEAD
admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)
admin.skip_confirmation!
admin.save!


# User.first.update_attributes!(
#   name:     'brock',
#   email: 'brockdonovan@gmail.com',
#   password: 'helloworld'
# )

=======

admin = User.new(
    name:     'Admin User',
    email:    'admin@example.com',
    password: 'helloworld',
    role:     'admin'
  )
admin.skip_confirmation!
admin.save!

brock = User.new(
  name:     'brock',
  email: 'brockdonovan@gmail.com',
  password: 'helloworld',
  role:     'admin'
)
brock.skip_confirmation!
brock.save!
>>>>>>> seedData
# Create a moderator
premium = User.new(
  name:     'Premium User',
  email:    'premium@example.com',
  password: 'helloworld',
  role:     'premium'
)
premium.skip_confirmation!
premium.save!

# Create a member
standard = User.new(
  name:     'Standard User',
  email:    'standard@example.com',
  password: 'helloworld'
)
standard.skip_confirmation!
standard.save!

users = User.all

<<<<<<< HEAD
# Create items
=======
# Create wikis
>>>>>>> seedData
10.times do
  Wiki.create!(
    user:   users.sample,
    title:  Faker::Lorem.word,
    body:  Faker::Lorem.paragraph,
<<<<<<< HEAD
    #private: Faker.random.array_element([true, false])
=======
>>>>>>> seedData
  )
end
wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
<<<<<<< HEAD
puts "#{Wiki.count} items created"
=======
puts "#{Wiki.count} wikis created"
>>>>>>> seedData
