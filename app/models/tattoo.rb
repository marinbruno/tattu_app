class Tattoo < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_all,
                  against: [:description],
                  associated_against: {
                    artist: :description,
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
      reh_tattoo: ["watercolor"],
      godo_art: ["dotwork", "blackwork"],
      mscaranari: ["dotwork", "blackwork"],
      francisco_lim: ["watercolor"]
    }
    artist_username = artist.instagram_username.parameterize.to_sym
    tag_name = tag_tattoo_hash[artist_username]
    array_of_tags = Tag.all
    tag_to_associate = array_of_tags.select { |tag| tag.name == tag_name.sample }
    tags << tag_to_associate
  end
end
