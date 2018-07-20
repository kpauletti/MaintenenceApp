require 'carrierwave'
class Ticket < ApplicationRecord
  belongs_to :car;

  mount_uploader :picture, PictureUploader;
end
