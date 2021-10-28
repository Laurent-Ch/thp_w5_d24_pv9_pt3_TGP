User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
Dm.destroy_all
JoinTagGossip.destroy_all
JoinUserDm.destroy_all

# City
10.times do
  City.create(
    name:Faker::Address.city, 
    zip_code:"#{'%02d' % rand(00..77)}000"
  )
end
cities_array = City.all

# Users
10.times do |i|
  rand_fname = Faker::Name.unique.first_name
  rand_lname = Faker::Name.unique.last_name
  User.create(
    first_name: rand_fname,
    last_name: rand_lname,
    description: Faker::Lorem.sentence(word_count: 4),
    email: "#{rand_fname}.#{rand_lname}@mail.com",
    age: rand(18..77),
    city:cities_array[rand(0..9)]
  )
end
users_array = User.all

# Gossip
20.times do |i|
  Gossip.create(
    title:"Potin n°#{i}",
    content:Faker::ChuckNorris.fact,
    user:users_array[rand(0..9)]
  )
end
gossips_array = Gossip.all

# Tag 
10.times do
  Tag.create(
    title: Faker::SlackEmoji.unique.people
  )
end
tags_array = Tag.all

# Création des Taggers, qui associent les messages à leurs tags respectifs 
Gossip.all.each do |each_gossip|
  random_times = rand(1..2)
  random_times.times do 
    JoinTagGossip.create(
      gossip: each_gossip,
      tag: tags_array[rand(0...tags_array.length)]
    )
  end
end

# Création de messages privés
10.times do
  Dm.create(
    content: Faker::Quote.yoda, 
    sender: users_array[rand(0...users_array.length)],
    recipient: users_array[rand(0...users_array.length)]
  )
end

# Comments
20.times do
  Comment.create(
    content: Faker::Books::Dune.quote,
    gossip: gossips_array[rand(0..19)],
    user: users_array[rand(0..9)]
  )
end

# Like
