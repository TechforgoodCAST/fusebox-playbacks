require 'application_system_test_case'

class CreatePlaybackTest < ApplicationSystemTestCase
  test 'create playback' do
    visit new_playback_path

    fill_in(:playback_organisation_name, with: 'ACME')

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
