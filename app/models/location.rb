class Location < ApplicationRecord
  belongs_to :locatable, polymorphic: true, optional: true

  def self.ransackable_attributes(auth_object = nil)
    [ "aliases", "id", "lat", "locatable_id", "locatable_type", "lon", "name" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "locatable" ]
  end
end
