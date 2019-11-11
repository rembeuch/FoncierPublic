class Reservation < ApplicationRecord
  belongs_to :flat
  belongs_to :guest, class_name: "User"
end
