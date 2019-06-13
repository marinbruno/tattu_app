class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :artist, dependent: :destroy

  has_one :photo, as: :photoable, dependent: :destroy

  def image
    photo.photo
  end


  accepts_nested_attributes_for :photo, :artist
end
