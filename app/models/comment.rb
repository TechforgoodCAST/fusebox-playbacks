class Comment < ApplicationRecord
  belongs_to :step, touch: true

  validates :author, :body, presence: true

  before_validation :mark_step_as_done!

  private

    def mark_step_as_done!
      step.update_column(:completed_on, Date.today) if done
    end
end
