require 'application_system_test_case'

class CreatePlaybackTest < ApplicationSystemTestCase
  setup do
    @user = create(:user)
  end

  test 'create playback' do
    visit new_playback_path
    sign_in

    fill_in(:playback_organisation_name, with: 'ACME')
    fill_in(:playback_email, with: 'test@wearecast.co.uk')

    click_link('Add Section')
    fill_in('Section name', with: 'Discover')

    click_link('Add Insight')
    fill_in('Insight name', with: 'Problem')
    select('We know')

    click_link('Add Step')

    within('#steps') { find('.trix-content').set('Conduct 5 user interview') }

    click_button('Create Playback')

    assert_equal(playback_path(Playback.last), current_path)
  end
end
