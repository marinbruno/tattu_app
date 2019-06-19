class GetInstagramDataService
  def parse_info_from_ig(artist)
    artist.description = artist.ig.biography
    artist.photo = Photo.new(remote_photo_url: artist.ig.data.dig('profile_pic_url'))
    artist.ig.media.each do |media_object|
      tattoo_hash = {
        description: media_object.data.dig('edge_media_to_caption', 'edges', 0, 'node', 'text'),
        artist: artist
      }
      new_tattoo = Tattoo.new(tattoo_hash)
      new_tattoo.photo = Photo.new(remote_photo_url: media_object.image_url)
      artist.places << Place.new(address: media_object.data.dig('location', 'name'))
      new_tattoo.tags << Tag.all.sample
      new_tattoo.save
    end
  end
end
