require 'application_system_test_case'

class WebhooksTest < ApplicationSystemTestCase
  # playback sucessfully created
  # playback not sucessfully created (e.g. missing org name)
  # playback not sucessfully created (e.g. no Airtable id)

  test 'new playback created' do
    assert_equal(Playback.count, 0)
    send_fake_webhook_request
    assert_equal(Playback.count, 1)
  end

  def send_fake_webhook_request
    body = {
      'id': 123,
      'org': 'ACME',
      'name': 'John',
      'email': 'john@email.com'
    }

    fake_webhook_request(
      webhooks_new_response_path('123'),
      headers: { 'Content-Type' => 'application/json' },
      body: body
    )
  end

  def fake_webhook_request(url, headers: {}, body: {})
    server = Capybara.current_session.server
    conn = Faraday.new(url: "http://#{server.host}:#{server.port}")
    conn.post do |req|
      req.url(url)
      req.headers.merge!(headers)
      req.body = body.to_json
    end
  end
end
