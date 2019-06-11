class Artist < ApplicationRecord
  belongs_to :user

  has_many :tattoos, dependent: :destroy
  has_many :taggings, through: :tattoos, dependent: :destroy
  has_many :photos, through: :tattoos, dependent: :destroy
end
