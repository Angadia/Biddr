# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

<<<<<<< HEAD
<<<<<<< HEAD
PASSWORD = "supersecret"

Bid.destroy_all
Auction.destroy_all
User.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!(:auctions)
ActiveRecord::Base.connection.reset_pk_sequence!(:bids)
ActiveRecord::Base.connection.reset_pk_sequence!(:users)

super_user = User.create( 
  first_name: "Jon", 
  last_name: "Snow", 
  email: "js@winterfell.gov", 
  password: PASSWORD,
  is_admin: true
)

10.times do |n|
  first_name = Faker::Name.first_name 
  last_name = Faker::Name.last_name 
  User.create( 
    first_name: first_name, 
    last_name: last_name,  
    email: "email#{n}@example.com", 
    password: PASSWORD 
  )
end

users = User.all
puts Cowsay.say("Created #{users.count} users", :tux) 
puts Cowsay.say("Admin login with #{super_user.email} and password of '#{PASSWORD}'", :cow)
puts Cowsay.say("Users email are #{(users.map do |user| user.email end).join(', ')}", :kitty)


10.times.map do
  user = users.sample
=======
=======
PASSWORD = "supersecret"

>>>>>>> c4505a0... Added user authentication; Added create and destroy actions for new sessions controller; Added current action for new users controller.
Bid.destroy_all
Auction.destroy_all
User.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!(:auctions)
ActiveRecord::Base.connection.reset_pk_sequence!(:bids)
ActiveRecord::Base.connection.reset_pk_sequence!(:users)

super_user = User.create( 
  first_name: "Jon", 
  last_name: "Snow", 
  email: "js@winterfell.gov", 
  password: PASSWORD,
  is_admin: true
)

10.times do |n|
  first_name = Faker::Name.first_name 
  last_name = Faker::Name.last_name 
  User.create( 
    first_name: first_name, 
    last_name: last_name,  
    email: "email#{n}@example.com", 
    password: PASSWORD 
  )
end

users = User.all
puts Cowsay.say("Created #{users.count} users", :tux) 
puts Cowsay.say("Admin login with #{super_user.email} and password of '#{PASSWORD}'", :cow)
puts Cowsay.say("Users email are #{(users.map do |user| user.email end).join(', ')}", :kitty)


10.times.map do
<<<<<<< HEAD
>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.
=======
  user = users.sample
>>>>>>> c4505a0... Added user authentication; Added create and destroy actions for new sessions controller; Added current action for new users controller.
  a = Auction.create(
    title: Faker::Commerce.product_name,
    description: Faker::ChuckNorris.fact,
    reserve_price: rand(51..100),
    ends_at: Faker::Date.forward(days: 7),
    created_at: Date.today,
<<<<<<< HEAD
<<<<<<< HEAD
    updated_at: Date.today,
    user_id: user.id
=======
    updated_at: Date.today
>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.
=======
    updated_at: Date.today,
    user_id: user.id
>>>>>>> c4505a0... Added user authentication; Added create and destroy actions for new sessions controller; Added current action for new users controller.
  )

  if a.valid?
    bid_amount = 5
    a.bids = rand(0..5).times.map do
<<<<<<< HEAD
<<<<<<< HEAD
      user = users.sample
=======
>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.
=======
      user = users.sample
>>>>>>> c4505a0... Added user authentication; Added create and destroy actions for new sessions controller; Added current action for new users controller.
      Bid.new(
        bid_amount: bid_amount+=5,
        created_at: Date.today,
        updated_at: Date.today,
<<<<<<< HEAD
<<<<<<< HEAD
        user_id: user.id
=======
>>>>>>> ba93988... Added create, index, show actions for auctions controller; Added create action for bids controller.
=======
        user_id: user.id
>>>>>>> c4505a0... Added user authentication; Added create and destroy actions for new sessions controller; Added current action for new users controller.
      )
    end
  else
    puts "Failed to persist Auction instance due to #{a.errors.full_messages.join(', ')}"
  end
end

puts Cowsay.say("Generated #{Auction.count} auctions using Faker.", :frogs)
puts Cowsay.say("Generated #{Bid.count} bids using Faker.", :tux)
