class Tattoo < ApplicationRecord
  belongs_to :artist

  has_many :photos, as: :photoable
end
