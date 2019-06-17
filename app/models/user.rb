class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :artist, dependent: :destroy

  has_many :tattoos, through: :artist

  has_one :photo, as: :photoable, dependent: :destroy

  DEFAULT_PHOTO = "default-avatar"

  def image
    photo.nil? ? DEFAULT_PHOTO : photo.photo
  end

  accepts_nested_attributes_for :photo, :artist, allow_destroy: true
end
