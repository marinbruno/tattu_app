class Place < ApplicationRecord
  belongs_to :artist

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
