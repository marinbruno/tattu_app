class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :artists, dependent: :destroy
  has_one :photo, as: :photoable, dependent: :destroy

  def image
    photo.photo
  end
end
