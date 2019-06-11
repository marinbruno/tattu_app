# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Tattoo.destroy_all
Artist.destroy_all
User.destroy_all
Tag.destroy_all
Tagging.destroy_all

users_array = []

10.times do
  puts 'Creating an user...'
  user_hash = {
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123456'
  }
  new_user = User.new(user_hash)
  new_user.save
  users_array << new_user
end

artists_array = []
5.times do
  user_hash = {
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123456'
  }
  new_user = User.new(user_hash)
  new_user.save
  users_array << new_user

  artist_hash = {
    description: Faker::Football.position,
    user: new_user
  }
  new_artist = Artist.new(artist_hash)
  new_artist.save
  artists_array << new_artist
end


tattoos_array = []
10.times do
  puts 'Creating a tatoo...'
  tattoo_hash = {
    artist: artists_array.sample
  }
  new_tattoo = Tattoo.new(tattoo_hash)
  new_tattoo.save
  tattoos_array << new_tattoo
end

tags_array = ['3D', 'Abstract', 'Ambigram', 'Black And Grey', 'Graffiti', 'Old School', 'Tribal']
arr = []
tags_array.each do |t|
  tag = Tag.new({name: t})
  tag.save
  arr << tag
end


taggings_array = []
10.times do
  tagging_hash = {
    tattoo: tattoos_array.sample,
    tag: arr.sample
  }
  new_tagging = Tagging.new(tagging_hash)
  new_tagging.save
  taggings_array << new_tagging
end

