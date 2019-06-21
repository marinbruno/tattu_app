class GetInstagramDataService
  def parse_info_from_ig(artist)
    artist.name = artist.ig.full_name
    puts 'Done: name'
    unless artist.ig.biography == ""
      artist.description = artist.ig.biography
      puts 'Done: description'
      artist.email_checker
      puts 'Done: business_email'
    end
    artist.photo = Photo.new(remote_photo_url: artist.ig.data.dig('profile_pic_url'))
    puts 'Done: profile_pic'
    artist.ig.media.each do |media_object|
      tattoo_hash = {
        description: media_object.data.dig('edge_media_to_caption', 'edges', 0, 'node', 'text'),
        artist: artist
      }
      new_tattoo = Tattoo.new(tattoo_hash)
      new_tattoo.photo = Photo.new(remote_photo_url: media_object.image_url)
      artist_place = Place.new(address: media_object.data.dig('location', 'name'))
      artist.places << artist_place unless artist.location_checker(artist_place.address)
      puts 'Done: place'
      new_tattoo.associate_tag_to_tattoo(artist)
      puts 'Done: tag'
      new_tattoo.save
      puts 'Done: tattoo'
    end
    artist.save
    puts 'Saving artist...'
    puts artist.errors.messages
  end
end
