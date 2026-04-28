class Event < ApplicationRecord
  has_one :location, as: :locatable
  has_many :people, through: :attendances
end
