class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :tattoos, through: :taggings
  has_many :artists, through: :taggings
end
