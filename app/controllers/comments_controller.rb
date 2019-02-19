class CommentsController < ApplicationController
  before_action :set_commentable, only: %i[new create]

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)

    if @comment.save
      if user_signed_in?
        CommentsMailer.new_comment(@comment, @commentable.playback).deliver_now
      end

      redirect_to(
        playback_path(@commentable.playback, anchor: @commentable.anchor),
        notice: 'Comment was successfully created.'
      )
    else
      render :new
    end
  end

  def set_helpful
    @playback = Playback.find(params[:commentable_id])

    @comment = Comment.find(params[:comment])
    @comment.update(helpful: params[:help])

    redirect_to(
      playback_path(@playback),
      notice: 'Thanks for your feedback!'
    )
  end

  private

    def set_commentable
      @commentable = Step.find_by_hashid(params[:commentable_id]) ||
                     Section.find_by_hashid(params[:commentable_id])
      redirect_back(fallback_location: root_path) unless @commentable
    end

    def comment_params
      params.require(:comment).permit(:author, :body, :done, :step_id, :helpful)
    end
end
