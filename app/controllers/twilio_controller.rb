class TwilioController < ApplicationController
  # include Webhookable
  # skip_before_action :verify_authenticity_token
  # TWILIO_NUMBER =  "5594713142"

  # def reply
  #   ga_url = 'http://104.131.73.180/api/v1/leads'
  #   @apiusers = HTTParty.get(url)
  # end

  def index
    message_body = params["Body"]
    from_number = params["From"]
    SMSLogger.log_text_message from_number, message_body
    binding.pry

  end

  def send_text_message(response)
    number_to_send_to = "4195089075"

    twilio_sid = TWILIO_KEY_SID
    twilio_token = 'poop'
    twilio_phone_number = '5594713142'

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => response
    )
  end

  def response
    if @message.include? "sick"
      response_message = "Feel better. We'll see you tomorrow."
    elsif @message.include? "late"
      response_message = "Oh no! We'll see you soon!"
    else
      response_message = "I'm sorry! We'll see you tomorrow."
    end
  end

end
