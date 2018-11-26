class Section < ApplicationRecord
  include Hashid::Rails

  belongs_to :playback, touch: true

  has_many :comments, as: :commentable, dependent: :destroy

  has_many :insights, dependent: :destroy
  accepts_nested_attributes_for :insights, allow_destroy: true
  validates_associated :insights

  validates :name, presence: true, uniqueness: { scope: :playback }

  def anchor
    "section-comment-#{id}"
  end
end
