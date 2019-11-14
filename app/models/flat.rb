class Flat < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :reservations
  validates :title, :address, :photo, :price_per_day, presence: true

  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
