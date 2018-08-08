class NotificationsController < ApplicationController
  rescue_from StandardError do |exception|
    trigger_sms_alerts(exception)
  end

  def trigger_sms_alerts(e)
    @alert_message = "
        [This is a test] ALERT! 
        It appears the server is having issues. 
        Exception: #{e}."

    @admin_list = YAML.load_file("config/administrators.yml")
    @admin_list.each do |admin|
      begin
        phone_number = admin["phone_number"]
        send_message(phone_number, @alert_message, @image_url)
        flash[:success] = "Exception: #{e}. Administrators will be notified."
      rescue
        flash[:alert] = "Something went wrong."
      end
    end

    redirect_to "/"
  end

  def index
  end

  def server_error
    raise "A test exception"
  end

  private

  def send_message(phone_number, alert_message, image_url)
    @twilio_number = Rails.application.secrets.twilio_number
    @client = Twilio::REST::Client.new Rails.application.secrets.twilio_sid, Rails.application.secrets.twilio_token

    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => phone_number,
      :body => alert_message,
      # US phone numbers can make use of an image as well.
      # :media_url => image_url
    )
    puts message.to
  end
end
