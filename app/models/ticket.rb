require "carrierwave"

class Ticket < ApplicationRecord
  belongs_to :car
  mount_uploaders :pictures, PictureUploader

  scope :category, -> (category) { where category: category }
  scope :location, -> (location) { where location: location }
  scope :completed, -> (completed) { where completed: completed }
  scope :car, -> (car) { where car_id: car }
  scope :created_after, -> (start_date) { where("created_at >= ?", start_date) }
  scope :created_before, -> (start_date) { where("created_at <= ?", start_date) }

  def notify
    @admin_list = YAML.load_file("config/administrators.yml")
    @twilio_number = ENV["TWILIO_NUMBER"]
    account_sid = ENV["TWILIO_SID"]
    @client = Twilio::REST::Client.new(account_sid, ENV["TWILIO_TOKEN"])
    reminder = "Ticket for #{self.car.name} has been completed."
    message = @client.api.account.messages.create(
      :from => @twilio_number,
      :to => @admin_list[0]["phone_number"],
      :body => reminder,
    )
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |ticket|
        csv << ticket.attributes.values_at(*column_names)
      end
    end
  end
end
