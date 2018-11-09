class Insight < ApplicationRecord
  CERTAINTY = [
    'We know',
    'We think we know',
    "We don't know"
  ].freeze

  belongs_to :section
  belongs_to :playback

  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true

  validates :name, :certainty, presence: true
  validates :certainty, inclusion: { in: CERTAINTY }

  # TODO: test
  def certainty_color
    CERTAINTY.zip(%w[green yellow red]).to_h[certainty]
  end
end
