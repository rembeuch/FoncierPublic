class Flat < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :reservations
end
