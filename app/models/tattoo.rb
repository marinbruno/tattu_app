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

  belongs_to :artist
  has_one :user, through: :artist

  validates :description, presence: true

  has_many :taggings, dependent: :destroy
  has_one :photo, as: :photoable, dependent: :destroy
  has_many :places, through: :artist
  has_many :tags, through: :taggings

  delegate :image, to: :artist, prefix: true
  delegate :name, to: :artist, prefix: true

  accepts_nested_attributes_for :photo, :taggings, allow_destroy: true

  def image
    photo&.photo
  end
end
