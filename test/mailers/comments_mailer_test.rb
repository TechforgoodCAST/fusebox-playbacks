require 'test_helper'

class CommentsMailerTest < ActionMailer::TestCase
  setup do
    @playback = create(:playback)
    @comment = create(:comment)
  end

  test 'new_comment' do
    mail = CommentsMailer.new_comment(@comment, @playback)
    assert_equal('New comment from John Doe', mail.subject)
    assert_equal([@playback.email], mail.to)
    assert_equal(['designhops@wearecast.org.uk'], mail.from)
  end
end
