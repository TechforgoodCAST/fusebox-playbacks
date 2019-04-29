class CommentsMailer < ApplicationMailer
  helper :playbacks

  def new_comment(comment, playback, email = playback.email)
    @comment = comment
    @playback = playback

    mail(to: email, subject: "New comment from #{@comment.author}")
  end
end
