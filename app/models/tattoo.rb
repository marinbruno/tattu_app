class Tattoo < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_all,
    against: [:description],
    associated_against: {
      artist: :description,
      user: :name,
      tags: :name
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  belongs_to :artist
  has_one :user, through: :artist

  validates :description, presence: true

  has_many :taggings, dependent: :destroy
  has_one :photo, as: :photoable, dependent: :destroy

  has_many :tags, through: :taggings

  delegate :image, to: :artist, prefix: true
  delegate :name, to: :artist, prefix: true

  def image
    photo.photo
  end
end
