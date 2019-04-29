class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_table

  def new_response
    table_record = JSON.parse(request.body.read)

    @playback = Playback.new(
      organisation_name: table_record['org'],
      author_name: table_record['name'],
      email: table_record['email']
    )

    @record = @table.find(table_record['id'])

    if @playback.save

      @record['playback'] = playback_url(@playback)
      @record.save

      head :ok
    else
      head :bad_request
    end
  end

  def airtable_confirm
    record = @table.all(filter: "{email} = '#{params[:email]}'")[0]
    record[params[:confirm]] = true if record

    begin
      @msg = if record&.save
               params[:msg] || 'Thanks! Your response has been recorded.'
             else
               'Sorry, something went wrong'
             end
    rescue Airrecord::Error => exception
      @msg = exception
    end
  end

  private

  def load_table
    @table = Airrecord.table(
      ENV['AIRTABLE_API_KEY'],
      ENV['AIRTABLE_APP_KEY'],
      'Attendee sign-up data'
    )
  end
end
