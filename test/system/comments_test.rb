require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase

  setup do
    @user = create(:user)
    
  end

  test 'send email when comment created' do 
    visit new_playback_path
    sign_in

    fill_in(:playback_organisation_name, with: 'ACME')

    click_link('Add Section')
    fill_in('Section name', with: 'Discover')

    click_button('Create Playback')

    click_on 'Ask for help'

    fill_in('Author', with: 'Author')
    find('trix-editor').click.set('Test')

    click_on 'Comment'

    assert(ActionMailer::Base.deliveries.count == 1)
    
  end

  
end
