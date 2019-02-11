require 'application_system_test_case'

class WebhooksTest < ApplicationSystemTestCase
  # playback sucessfully created
  # playback not sucessfully created (e.g. missing org name)
  # playback not sucessfully created (e.g. no Airtable id)

  setup do
    @body = {
      'id': 'recEGwuM00enWF3NB',
      'org': 'ACME',
      'name': 'John',
      'email': 'john@email.com'
    }
  end

  test 'playback successfully created with good info' do
    current_count = Playback.count

    send_webhook_request(@body, 'recEGwuM00enWF3NB')
    assert_equal(Playback.count, current_count + 1)

  end

  test 'playback not successfully created with bad org name ' do
    @body['org'] = ''

    current_count = Playback.count

    send_webhook_request(@body, 'recEGwuM00enWF3NB')
    assert_equal(Playback.count, current_count)

  end

  def send_webhook_request(body, path)
    webhook_request(
      webhooks_new_response_path(path),
      headers: { 'Content-Type' => 'application/json' },
      body: body
    )
  end


  def webhook_request(url, headers: {}, body: {})
    server = Capybara.current_session.server
    conn = Faraday.new(url: "http://#{server.host}:#{server.port}")
    conn.post do |req|
      req.url(url)
      req.headers.merge!(headers)
      req.body = body.to_json
    end
  end
end
