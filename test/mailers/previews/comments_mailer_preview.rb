# Preview all emails at http://localhost:3000/rails/mailers/comments_mailer
class CommentsMailerPreview < ActionMailer::Preview
  def new_comment
    comment = Comment.new(
      author: 'John Doe',
      body: '<div>Is <a href="#">this</a> a good resource</div>',
      commentable: Step.new(id: 1, name: 'State your problem')
    )
    CommentsMailer.new_comment(comment)
  end
end
