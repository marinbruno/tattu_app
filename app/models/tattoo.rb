class Tattoo < ApplicationRecord
  belongs_to :artist

  validates :description, presence: true

  has_many :taggings, dependent: :destroy
  has_one :photo, as: :photoable, dependent: :destroy
  has_many :tags, through: :taggings
end
