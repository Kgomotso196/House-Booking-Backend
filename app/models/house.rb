class House < ApplicationRecord
  belongs_to :user
  has_one :reservation
  validates :house_name, :house_image, :location, :description, presence: true
end
