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

user_photo_url = 'https://images.unsplash.com/photo-1481882466320-51765fd9fe21'
users_array = []
3.times do
  puts 'Creating an user...'
  user_hash = {
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123456'
  }
  new_user = User.new(user_hash)
  new_user.photo = Photo.new(remote_photo_url: user_photo_url)
  new_user.save!
  users_array << new_user
end

tags_array = []
tags_names = ['watercolor', 'dotwork', 'blackwork', 'old school', 'abstract', 'geometric', 'realism']
tags_names.each do |tag_name|
  puts 'Creating a new tag....'
  new_tag = Tag.new(name: tag_name)
  tags_array << new_tag
  new_tag.save!
end

usernames_array = ["victoroctaviano",
                  "rodrigotas",
                  "dudublacktattoo",
                  "ohjessica_o",
                  "brisaissa",
                  "skazxim",
                  "bricegomes",
                  "maxvorax",
                  "pedrozanjos",
                  "casdecarvalho",
                  "angelojolies",
                  "lucasm_tattoo",
                  "theteabag",
                  "ubiratanamorim",
                  "diegoferrink",
                  "tampatattoo",
                  "godo_art",
                  "mscaranari",
                  "francisco_lim"]
artists_array = []
usernames_array.each do |ig_username|
  puts 'Creating an artist...'
  new_artist = Artist.new(instagram_username: ig_username)
  new_artist.save
  # puts 'Creating his user model...'
  # new_artist.user = User.new(name: new_artist.ig.full_name, email: "#{ig_username}@fakemail.com", password: '123456')
  # new_artist.description = new_artist.ig.biography
  # new_artist.user.photo = Photo.new(remote_photo_url: new_artist.ig.data.dig('profile_pic_url'))
  # media_array = []
  # new_artist.ig.media.each do |media_object|
  #   media_array << media_object
  # end
  # media_array.each do |media|
  #   tattoo_hash = {
  #     description: media.data.dig('edge_media_to_caption', 'edges', 0, 'node', 'text'),
  #     artist: new_artist
  #   }
  #   puts 'Creating one of the tattoos...'
  #   new_tattoo = Tattoo.new(tattoo_hash)
  #   puts 'Creating the tattoo photo....'
  #   new_tattoo_photo = Photo.new(remote_photo_url: media.image_url)
  #   new_tattoo.photo = new_tattoo_photo
  #   new_artist.places << Place.new(address: media.data.dig('location', 'name'))
  #   new_tattoo.tags << tags_array.sample
  #   new_tattoo.save!
  # end
  # new_artist.save!
end
