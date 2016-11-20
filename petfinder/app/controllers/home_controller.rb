class HomeController < ApplicationController
  def index
    @pets = Pet.all
    @hash = Gmaps4rails.build_markers(@pets) do |pet, marker|
      marker.lat pet.latitude
      marker.lng pet.longitude
    end

    @arr = []
    @hash.each do |value|
      @arr.push(value.values.to_a)
    end
    p @arr
  end


end
