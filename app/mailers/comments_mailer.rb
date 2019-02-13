class CommentsMailer < ApplicationMailer
  helper :playbacks

  def new_comment(comment, playback)
    @comment = comment
    @playback = playback

    subject = "New comment from #{@comment.author}"
    mail(to: @playback.email, bcc: 'hello@wearecast.org.uk', subject: subject)
  end
end
