class CommentsController < ApplicationController
  before_action :set_comment, only: %i[new create]

  def new
    @comment = @step.comments.new
  end

  def create
    @comment = @step.comments.new(comment_params)

    if @comment.save
      CommentsMailer.new_comment(@comment).deliver_now
      redirect_to(
        playback_path(@step.playback, anchor: "step-#{@step.id}"),
        notice: 'Comment was successfully created.'
      )
    else
      render :new
    end
  end

  private

    def set_comment
      @step = Step.find_by_hashid(params[:step_id])
      redirect_back(fallback_location: root_path) unless @step
    end

    def comment_params
      params.require(:comment).permit(:author, :body, :done, :step_id)
    end
end
