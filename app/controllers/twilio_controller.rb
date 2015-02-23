class TwilioController < ApplicationController
  # include Webhookable
  # skip_before_action :verify_authenticity_token
  TWILIO_NUMBER =  "5594713142"

  # def reply
  #   ga_url = 'http://104.131.73.180/api/v1/leads'
  #   @apiusers = HTTParty.get(url)
  # end
  skip_before_filter :force_ssl

  def index
    @client = Twilio::REST::Client.new TWILIO_KEY_SID, TWILIO_AUTH_TOKEN
    message_body = params["Body"]
    from_number = params["From"]
    SMSLogger.log_text_message from_number, message_body
    number = convert_number(from_number)
    student = Student.find_by(phone_number: number)
    create_attendance_record
    send_text_message(response)
  end

  def send_text_message(response)
    number_to_send_to = from_number

    twilio_sid = TWILIO_KEY_SID
    twilio_token = TWILIO_AUTH_TOKEN
    twilio_phone_number = TWILIO_NUMBER

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => response
    )
  end

  def response
    if message_body.include? "sick"
      response_message = "Feel better. We'll see you tomorrow."
    elsif message_body.include? "late"
      response_message = "Oh no! We'll see you soon!"
    else
      response_message = "I'm sorry! We'll see you tomorrow."
    end
  end

  def convert_number(number)
    number[0] = ""
    number[0] = ""
    number_array = number.slice
    number_array.insert(3, "-")
    number_array.insert(7, "-")
    number_array.join
  end

  def create_attendance_record
    if message_body.include? "sick"
      absence_type = "Excused"
    elsif message_body.include? "late"
      absence_type = "Late"
    end
    Attendance.create(
      absence_type: absence_type,
      date: Date.today,
      student_id: student
      )
  end

end
