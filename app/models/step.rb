class Step < ApplicationRecord
  belongs_to :insight

  validates :name, presence: true
end
