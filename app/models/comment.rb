class Comment < ApplicationRecord
  HELPFUL = {
    'No' => -1,
    'Kind of' => 0,
    'Yes' => 1
  }.freeze

  belongs_to :commentable, polymorphic: true, touch: true

  validates :author, :body, presence: true
  validates :helpful, inclusion: { in: HELPFUL }

  before_validation :mark_step_as_done!
  after_create :update_comments_count!

  private

    def mark_step_as_done!
      step.update_column(:completed_on, Date.today) if done
    end

    def update_comments_count!
      Playback.increment_counter(:comments_count, commentable.playback_id)
    end
end
