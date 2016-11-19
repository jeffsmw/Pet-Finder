class Sighting < ApplicationRecord

  belongs_to :user
  attr_accessor :facebook_post_this

end
