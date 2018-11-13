class CommentsMailer < ApplicationMailer
  helper :playbacks

  def new_comment(comment)
    @comment = comment
    subject = "New comment from #{@comment.author}"
    mail(to: 'hello@wearecast.org.uk', subject: subject)
  end
end
