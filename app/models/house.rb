class House < ApplicationRecord
  belongs_to :user
  validates :house_name, :house_image, :location, :description, presence: true
end
