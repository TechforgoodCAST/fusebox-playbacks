require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1280, 700]

  setup { Rails.application.load_seed }

  def sign_in(user = @user)
    fill_in(:user_email, with: user.email)
    fill_in(:user_password, with: user.password)
    click_button('Log in')
  end
end
