class Tattoo < ApplicationRecord
  belongs_to :artist

  has_many :taggings, dependent: :destroy
  has_many :photos, as: :photoable, dependent: :destroy
  has_many :tags, through: :taggings
end
