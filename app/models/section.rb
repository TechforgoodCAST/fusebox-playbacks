class Section < ApplicationRecord
  belongs_to :playback

  has_many :insights, dependent: :destroy
  accepts_nested_attributes_for :insights, allow_destroy: true
  validates_associated :insights

  validates :name, presence: true, uniqueness: { scope: :playback }
end
