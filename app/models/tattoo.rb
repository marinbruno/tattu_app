class Tattoo < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_all,
                  against: [:description],
                  associated_against: {
                    artist: [:description, :instagram_username, :name],
                    user: :name,
                    tags: :name,
                    places: :address
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
  scope :random, -> { order(Arel.sql("random()")) }

  belongs_to :artist
  has_one :user, through: :artist

  has_many :taggings, dependent: :destroy
  has_one :photo, as: :photoable, dependent: :destroy
  has_many :places, through: :artist
  has_many :tags, through: :taggings

  delegate :image, to: :artist, prefix: true
  delegate :name, to: :artist, prefix: true

  accepts_nested_attributes_for :photo, :taggings, allow_destroy: true

  def image
    photo.photo
  end

  def associate_tag_to_tattoo(artist)
    tag_tattoo_hash = {
      victoroctaviano: ["watercolor"],
      rodrigotas: ["watercolor", "dotwork"],
      dudublacktattoo: ["blackwork"],
      ohjessica_o: ["old school"],
      brisaissa: ["old school"],
      skazxim: ["watercolor", "abstract"],
      bricegomes: ["blackwork"],
      maxvorax: ["blackwork", "abstract"],
      pedrozanjos: ["blackwork", "abstract"],
      casdecarvalho: ["old school"],
      angelojolies: ["blackwork"],
      lucasm_tattoo: ["geometric"],
      theteabag: ["old school"],
      ubiratanamorim: ["realism"],
      diegoferrink: ["realism"],
      tampatattoo: ["realism"],
      godo_art: ["dotwork", "blackwork"],
      mscaranari: ["dotwork", "blackwork"],
      francisco_lim: ["watercolor"]
    }

    artist_username = artist.instagram_username.parameterize.to_sym
    puts "------ artist username is #{artist_username}"
    tag_name = tag_tattoo_hash[artist_username]
    #puts "-------- tag_name is #{tag_name}"
    array_of_tags = Tag.all

    # tag_to_associate = array_of_tags.select do |tag|
    #   tag_sample = tag_name.sample
    #   puts "-------- tag sample is #{tag_sample} "
    #   puts "--------- tag name is #{tag.name}"
    #   tag.name == tag_sample

    #   puts "CHECKING IF TAG IS INCKUDE"
    #   puts "ANSWER IS #{array_of_tags.map(&:name).include?(tag_sample)}"

    # end

    tag_to_associate = Tag.where(name: tag_name.sample).first

    puts "tag_to_associate is #{tag_to_associate}"
    self.tags << tag_to_associate
    puts "tags is now:"
    puts "----------------"
    p tags
  end
end
