class Step < ApplicationRecord
  include Hashid::Rails

  belongs_to :insight, touch: true
  has_many :comments, as: :commentable, dependent: :destroy

  validates :name, presence: true

  def anchor
    "step-comment-#{id}"
  end

  def playback
    insight.section.playback
  end
end
