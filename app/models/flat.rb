class Flat < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :reservations
  validates :title, :address, :photo, :price_per_day, presence: true

  mount_uploader :photo, PhotoUploader
end
