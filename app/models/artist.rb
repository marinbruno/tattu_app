class Artist < ApplicationRecord
  belongs_to :user

  has_many :places, dependent: :destroy

  has_many :tattoos, dependent: :destroy
  has_many :taggings, through: :tattoos, dependent: :destroy

  has_many :tags, -> { distinct }, through: :tattoos

  has_one :photo, as: :avatar, through: :user, dependent: :destroy

  accepts_nested_attributes_for :photo

  delegate :image, to: :user
  delegate :name, to: :user
  delegate :name=, to: :user
  delegate :email, to: :user
  delegate :password, to: :user

  include Grammer
  grammed_by :instagram_username, on: :ig
end
