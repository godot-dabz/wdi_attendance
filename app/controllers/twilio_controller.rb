class TwilioController < ApplicationController
  # include Webhookable
  # skip_before_action :verify_authenticity_token
  # TWILIO_NUMBER =  "5594713142"

  # def reply
  #   ga_url = 'http://104.131.73.180/api/v1/leads'
  #   @apiusers = HTTParty.get(url)
  # end

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
