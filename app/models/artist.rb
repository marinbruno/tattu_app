class Artist < ApplicationRecord
  belongs_to :user

  has_many :tattoos
  has_many :tags, through: :tattoos
  has_many :photos, through: :tattoos
end
