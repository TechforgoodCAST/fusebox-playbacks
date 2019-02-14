require 'test_helper'

class PlaybackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'try to create playback with email and organisation name' do
    playback = Playback.new(organisation_name: "ACME", email: "test@example.com")
    assert playback.valid?
  end

  test 'try to create playback without email' do
    playback = Playback.new(organisation_name: "ACME")
    refute playback.valid?
  end

  test 'try to create playback without organisation name' do
    playback = Playback.new(email: "test@example.com")
    refute playback.valid?
  end
end
