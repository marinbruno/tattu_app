class Place < ApplicationRecord
  belongs_to :artist

  geocoded_by :address

  validates :address, uniqueness: { scope: :artist }
  after_validation :geocode, if: :will_save_change_to_address?
end
