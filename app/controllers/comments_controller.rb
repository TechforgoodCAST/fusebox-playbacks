class CommentsController < ApplicationController
  before_action :set_commentable, only: %i[new create]

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)

    if @comment.save
      CommentsMailer.new_comment(@comment).deliver_now
      redirect_to(
        playback_path(@commentable.playback, anchor: @commentable.anchor),
        notice: 'Comment was successfully created.'
      )
    else
      render :new
    end
  end

  private

    def set_commentable
      @commentable = Step.find_by_hashid(params[:commentable_id]) ||
                     Section.find_by_hashid(params[:commentable_id])
      redirect_back(fallback_location: root_path) unless @commentable
    end

    def comment_params
      params.require(:comment).permit(:author, :body, :done, :step_id)
    end
end
