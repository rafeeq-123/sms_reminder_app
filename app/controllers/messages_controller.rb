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
    message_body = params["Body"]
    to_number = params["To"]
    boot_twilio
    @client.messages.create(
      from: Rails.application.secrets.twilio_number,
      to:   to_number,
      body: 'You won Congrats on your new Mini!! We will be sending you more information for your new car!'
    )
  end

  private

  def boot_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
