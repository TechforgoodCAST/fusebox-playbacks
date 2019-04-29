require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase

  setup do
    @user = create(:user)
    @playback = create(:playback)
    @section = create(:section)
    @deliveries = ActionMailer::Base.deliveries
  end

  test 'notify Playback#email when comment author signed in' do
    visit new_playback_path
    sign_in

    fill_in(:playback_organisation_name, with: 'ACME')
    fill_in(:playback_email, with: 'test@wearecast.co.uk')

    click_link('Add Section')
    fill_in('Section name', with: 'Discover')

    click_button('Create Playback')

    click_on 'Ask for help'

    fill_in('Author', with: 'Author')
    find('trix-editor').click.set('Test')

    click_on 'Comment'

    assert(@deliveries.size == 1)
    assert_includes(@deliveries.last.to, 'test@wearecast.co.uk')
  end

  test 'notify CAST when comment author not signed in' do
    visit playback_path(@playback)

    click_on 'Ask for help'

    fill_in('Author', with: 'Author')
    find('trix-editor').click.set('Test')

    click_on 'Comment'

    assert(@deliveries.size == 1)
    assert_includes(@deliveries.last.to, 'designhops@wearecast.org.uk')
  end
end
