class Flat < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :reservations
  validates :title, :address, :photo, :description, :price_per_day, :square_meter, presence: true


  mount_uploader :photo, PhotoUploader
end
