class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :tattoos, through: :taggings
  has_many :artists, through: :taggings

  TAG_NAMES = ['3D', 'Abstract', 'Ambigram', 'Black And Grey', 'Graffiti', 'Old School', 'Tribal']

  def css
    tag_index = TAG_NAMES.index(name)
    bootstrap_tags = ['badge-primary', 'badge-secondary', 'badge-success', 'badge-danger', 'badge-warning', 'badge-info', 'badge-light', 'badge-dark']
    return "badge badge-pill #{bootstrap_tags[tag_index]}"
  end
end
