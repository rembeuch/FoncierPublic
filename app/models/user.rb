class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :flats, foreign_key: :owner_id
  has_many :reservations, foreign_key: :guest_id

  has_many :owner_reservations, through: :flats, source: :reservations
  mount_uploader :avatar, PhotoUploader

  validates :first_name, presence: true
  validates :last_name, presence: true

end
