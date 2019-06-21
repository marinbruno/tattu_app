class Tag < ApplicationRecord
  TAG_NAMES = ['watercolor', 'dotwork', 'blackwork', 'old school', 'abstract', 'geometric', 'realism']

  has_many :taggings, dependent: :destroy
  has_many :tattoos, through: :taggings
  has_many :artists, through: :taggings

  scope :with_count, -> { group(:name).count }

  def css
    tag_index = TAG_NAMES.index(name)
    bootstrap_tags = ['badge-primary', 'badge-secondary', 'badge-success', 'badge-danger', 'badge-warning', 'badge-info', 'badge-light', 'badge-dark']
    return "badge badge-pill #{bootstrap_tags[tag_index]} badge-#{name.parameterize}"
  end
end
