class Artist < ApplicationRecord

  belongs_to :user

  has_many :tattoos, dependent: :destroy
  has_many :taggings, through: :tattoos, dependent: :destroy

  has_one :photo, as: :avatar, through: :user, dependent: :destroy
  accepts_nested_attributes_for :photo

  delegate :image, to: :user
  delegate :name, to: :user
end
