require "carrierwave"

class Ticket < ApplicationRecord
  belongs_to :car

  mount_uploaders :pictures, PictureUploader
end
