class Playback < ApplicationRecord
  include Hashid::Rails

  has_many :sections, dependent: :destroy
  accepts_nested_attributes_for :sections, allow_destroy: true
  validates_associated :sections

  validates :organisation_name, :email, presence: true

  def self.query(col, param)
    param.blank? ? all : where(col => param)
  end
end
