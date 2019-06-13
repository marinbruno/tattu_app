class Tattoo < ApplicationRecord
  belongs_to :artist

  validates :description, presence: true

  has_many :taggings, dependent: :destroy
  has_one :photo, as: :photoable, dependent: :destroy

  has_many :tags, through: :taggings

  delegate :image, to: :artist, prefix: true
  delegate :name, to: :artist, prefix: true

  accepts_nested_attributes_for :photo, :taggings

  def image
    photo.photo
  end
end
