class Step < ApplicationRecord
  belongs_to :insight, touch: true

  validates :name, presence: true
end
