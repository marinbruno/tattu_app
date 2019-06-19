class Artist < ApplicationRecord
  belongs_to :user, optional: true

  has_many :places, dependent: :destroy

  has_many :tattoos, dependent: :destroy
  has_many :taggings, through: :tattoos, dependent: :destroy

  has_many :tags, -> { distinct }, through: :tattoos

  has_one :photo, as: :photoable, dependent: :destroy

  accepts_nested_attributes_for :photo

  validates :instagram_username, presence: true

  # delegate :image, to: :user
  # delegate :name, to: :user
  # delegate :name=, to: :user
  delegate :email, to: :user
  delegate :password, to: :user

  include Grammer
  grammed_by :instagram_username, on: :ig

  def update_instagram_data!
    GetInstagramDataService.new.parse_info_from_ig(self)
  end

  def image
    photo.photo
  end
end
