class Person < ApplicationRecord
  has_one :location, as: :locatable

  has_many :events, through: :attendances
end
