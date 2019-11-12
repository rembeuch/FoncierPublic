class Reservation < ApplicationRecord
  belongs_to :flat
  belongs_to :guest, class_name: "User"

  def set_total_price!
    self.price = (end_date - start_date).to_i * flat.price_per_day
  end
end
