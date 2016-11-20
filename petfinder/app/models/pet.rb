class Pet < ApplicationRecord

  belongs_to :user
  attr_accessor :facebook_post_this
  attr_accessor :address, :latitude, :longitude
  geocoded_by :address
  # after_validations: :geocode
  after_validation :geocode
end
