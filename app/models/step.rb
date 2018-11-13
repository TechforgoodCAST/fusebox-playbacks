class Step < ApplicationRecord
  include Hashid::Rails

  belongs_to :insight, touch: true
  has_many :comments, dependent: :destroy

  validates :name, presence: true

  def playback
    insight.section.playback
  end
end
