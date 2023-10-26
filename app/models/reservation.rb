# Singularize the class name
class Reservation < ApplicationRecord
  belongs_to :house
  belongs_to :user
  validates :checking_date, :checkout_date, :city, :house_price, presence: true # Separate attributes with commas
end
