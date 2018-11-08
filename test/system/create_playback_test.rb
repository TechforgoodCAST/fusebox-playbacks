require 'application_system_test_case'

class CreatePlaybackTest < ApplicationSystemTestCase
  test 'create playback' do
    visit new_playback_path

    fill_in(:playback_organisation_name, with: 'ACME')

    click_link('add insight')
    select('Discover')
    fill_in('Insight name', with: 'Problem')
    select('We know')

    click_link('add step')
    fill_in('Name', with: 'Conduct 5 user interviews')

    click_button('Create Playback')

    assert_equal(playback_path(Playback.last), current_path)
  end
end
