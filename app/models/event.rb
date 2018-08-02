class Event < ApplicationRecord
    validates :title, presence: true
    after_create :reminder
    attr_accessor :date_range
  
    def all_day_event?
      self.start == self.start.midnight && self.end == self.end.midnight ? true : false
    end

    def reminder
      @twilio_number = Rails.application.secrets.twilio_number
      account_sid = Rails.application.secrets.twilio_sid
      @client = Twilio::REST::Client.new account_sid, Rails.application.secrets.twilio_token
      time_str = ((self.start).localtime).strftime("%I:%M%p on %b. %d, %Y")
      reminder = "#{self.title} is scheduled today."
      message = @client.api.account(account_sid).messages.create(
        :from => @twilio_number,
        :to => self.phone_number,
        :body => reminder,
      )
    end
  
    def when_to_run
      self.start - 12.hours
    end
  
    handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }


  end
  