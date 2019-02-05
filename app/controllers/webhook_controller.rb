class WebhookController < ApplicationController

    skip_before_action :verify_authenticity_token

    def new_response

        table_record = JSON.parse(request.body.read)

        @playback = Playback.new

        @playback.organisation_name = table_record["org"]
        @playback.author_name = table_record["name"]
        @playback.email = table_record["email"]

        # save playback and get link
        if @playback.save

            table = Airrecord.table("keyM4XBVfiFNw30XP", "appchfb5dUtfrlVSZ", "Attendee sign-up data")

            # use https://github.com/joelcogen/airtable-rails to send newly created link back to airtable

            @record = table.find(table_record["id"])
            @record["playback"] = "https://fusebox-playbacks.herokuapp.com/playbacks/#{@playback.hashid}"
            @record.save

            head :ok

        else
            head :bad_request
        end
        
    end
end
