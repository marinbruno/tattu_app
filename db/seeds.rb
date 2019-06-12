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
15.times do
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
  puts 'Creating an artist...'
  user_hash = {
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123456'
  }
  new_user = User.new(user_hash)
  new_user.save

  artist_hash = {
    description: Faker::Sports::Football.position,
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

tags_names = ['3D', 'Abstract', 'Ambigram', 'Black And Grey', 'Graffiti', 'Old School', 'Tribal']
tags_array = []
tags_names.each do |tag|
  tag = Tag.new({name: tag})
  tag.save
  tags_array << tag
end


taggings_array = []
10.times do
  tagging_hash = {
    tattoo: tattoos_array.sample,
    tag: tags_array.sample
  }
  new_tagging = Tagging.new(tagging_hash)
  new_tagging.save
  taggings_array << new_tagging
end

user_photo_url = 'https://images.unsplash.com/photo-1481882466320-51765fd9fe21'
artist_photo_url = 'https://images.unsplash.com/photo-1550364387-2893ac373664'
tattoo_photo_url = 'https://images.unsplash.com/photo-1521308452854-e037c0062a1e'

users_array.each do |user|
  puts 'Saving photo to an user...'
  user_photo = Photo.new(remote_photo_url: user_photo_url)
  user_photo.save
  user.photo = user_photo
  user.save
end

artists_array.each do |artist|
  puts 'Saving photo to an artist...'
  artist_photo = Photo.new(remote_photo_url: artist_photo_url)
  artist_photo.save
  artist.user.photo = artist_photo
  artist.save
end

tattoos_array.each do |tattoo|
  puts 'Saving photo to a tattoo...'
  tattoo_photo = Photo.new(remote_photo_url: tattoo_photo_url)
  tattoo_photo.save
  tattoo.photo = tattoo_photo
  tattoo.save
end
