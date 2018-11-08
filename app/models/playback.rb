class Playback < ApplicationRecord
  has_many :insights, dependent: :destroy
  accepts_nested_attributes_for :insights, allow_destroy: true
  validates_associated :insights

  validates :organisation_name, presence: true
end
