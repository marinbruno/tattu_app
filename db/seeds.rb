require 'faker'

puts 'Destroying tattoos....'
Tattoo.destroy_all
puts 'Destroying artists....'
Artist.destroy_all
puts 'Destroying users....'
User.destroy_all
puts 'Destroying tags....'
Tag.destroy_all
puts 'Destroying taggings....'
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

usernames_array = ["victoroctaviano",
                  "rodrigotas",
                  "dudublacktattoo",
                  "Koezukatattoo",
                  "sousa.tattoo",
                  "andrecruztattoo",
                  "ohjessica_o",
                  "brisaissa",
                  "asduarte_89",
                  "skazxim",
                  "bricegomes",
                  "maxvorax",
                  "pedrozanjos",
                  "casdecarvalho",
                  "angelojolies",
                  "lucasm_tattoo",
                  "theteabag",
                  "tonyvilella",
                  "ubiratanamorim",
                  "diegoferrink",
                  "tampatattoo",
                  "reh.tattoo",
                  "william.marin_ink",
                  "godo_art",
                  "mscaranari",
                  "joaobeber",
                  "francisco_lim"]
artists_array = []
tags_names = ['Realism', 'Abstract', 'Neo Traditional', 'Blackwork', 'Graffiti', 'Old School', 'Tribal']
usernames_array.each do |ig_username|
  puts 'Creating an artist...'
  new_artist = Artist.new(instagram_username: ig_username)
  puts 'Creating his user model...'
  new_artist.user = User.new(name: new_artist.ig.full_name, email: "#{ig_username}@fakemail.com", password: '123456')
  new_artist.description = new_artist.ig.biography
  media_array = []
  new_artist.ig.media.each do |media_object|
    media_array << media_object
  end
  media_array.each do |media|
    description_array = Faker::Hipster.words(4, true)
    tattoo_hash = {
      description: "##{description_array[0]} ##{description_array[1]} ##{description_array[2]} ##{description_array[3]}",
      artist: new_artist
    }
    puts 'Creating one of the tattoos...'
    new_tattoo = Tattoo.new(tattoo_hash)
    puts 'Creating the tattoo photo....'
    new_tattoo_photo = Photo.new(remote_photo_url: media.image_url)
    new_tattoo.photo = new_tattoo_photo
    puts 'Creating the tattoo\'s tag...'
    new_tattoo_tag = Tag.new(name: tags_names.sample)
    new_tattoo.save!
  end
  new_artist.save!
  puts new_artist.errors.messages
end

user_photo_url = 'https://images.unsplash.com/photo-1481882466320-51765fd9fe21'

users_array.each do |user|
  puts 'Saving photo to an user...'
  user_photo = Photo.new(remote_photo_url: user_photo_url)
  user.photo = user_photo
  user.save
end
