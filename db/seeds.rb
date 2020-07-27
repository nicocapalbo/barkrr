# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

p "0. Destroying all data"

Following.destroy_all
Tweet.destroy_all
User.destroy_all

p "1. Creating users..."

30.times do
  name = Faker::Twitter.screen_name
  User.create(username: name , handle: name, email: "#{name}@mail.com", password: '123456', password_confirmation: '123456')
end

p "2. Creating tweets..."

70.times do
  Tweet.create(user_id: rand(1..30), text: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4))
end

p "3. Creating followings..."

followed = 1
30.times do
  follower = (1..30).to_a.shuffle
  indexpos = 0
  rand(5..30).times do
    Following.create(followed_id: followed, follower_id: follower[indexpos])
    indexpos += 1
  end
  followed += 1
end


