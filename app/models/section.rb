class Section < ApplicationRecord
  validates :name, uniqueness: true
end
