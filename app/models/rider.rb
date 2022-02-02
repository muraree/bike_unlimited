class Rider < ApplicationRecord
  validates :licence_number, length: { is: 7 }, uniqueness: true
  validates :bike_number, uniqueness: true
end
