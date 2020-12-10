class ParksController < ApplicationController

  def index
    @parks = ParkFacade.find_park(params[:state])
  end
end
