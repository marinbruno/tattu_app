class Artist < ApplicationRecord
  belongs_to :user, optional: true

  has_many :places, dependent: :destroy

  has_many :tattoos, dependent: :destroy
  has_many :taggings, through: :tattoos, dependent: :destroy

  has_many :tags, -> { distinct }, through: :tattoos

  has_one :photo, as: :photoable, dependent: :destroy

  accepts_nested_attributes_for :photo

  # delegate :image, to: :user
  # delegate :name, to: :user
  # delegate :name=, to: :user
  delegate :email, to: :user
  delegate :password, to: :user

  include Grammer
  grammed_by :instagram_username, on: :ig

  DEFAULT_PHOTO = "default-avatar-20190617"

  def image
    photo.nil? ? DEFAULT_PHOTO : photo.photo
  end
end
