class MessagesController < ApplicationController
 # skip_before_filter :verify_authenticity_token

  def reply
    message_body = params["Body"]
    from_number = params["From"]
    boot_twilio
    sms = @client.messages.create(
      from: Rails.application.secrets.twilio_number,
      to: from_number,
      body: "Who ever has this number: #{from_number} Rafeeq is sending messages from his app"
    )

  end

  def send(phone_number)
    today = Time.now
    date_sent = params["DateSent"]
    message_body = params["Body"]
    to_number = params["To"]
    boot_twilio
    @client.messages.create(
      from: Rails.application.secrets.twilio_number,
      to:   to_number,
      date: date_sent,
      media_url: "https://www.cia.gov/library/publications/the-world-factbook/graphics/flags/large/sp-lgflag.gif",
      body: "Yo creo que estoy gastando mucho dienro haciendo esto, baby!"

      )
    end


  private

  def boot_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
