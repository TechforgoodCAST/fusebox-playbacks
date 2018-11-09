class Playback < ApplicationRecord
  has_many :sections, dependent: :destroy
  accepts_nested_attributes_for :sections, allow_destroy: true
  validates_associated :sections

  validates :organisation_name, presence: true
end
