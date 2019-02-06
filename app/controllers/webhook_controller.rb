class WebhookController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new_response
    table_record = JSON.parse(request.body.read)

    @playback = Playback.new(
      organisation_name: table_record['org'],
      author_name: table_record['name'],
      email: table_record['email']
    )

    if @playback.save
      table = Airrecord.table(
        ENV['AIRTABLE_API_KEY'],
        ENV['AIRTABLE_APP_KEY'],
        'Attendee sign-up data'
      )

      @record = table.find(table_record['id'])
      @record['playback'] = playback_url(@playback)
      @record.save

      head :ok
    else
      head :bad_request
    end
  end
end
