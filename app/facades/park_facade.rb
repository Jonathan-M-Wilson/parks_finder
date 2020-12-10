class ParkFacade

  def self.find_park(state)
    state_park = get_park_data(state)
    state_park[:data].map do |park_data|
      Park.new(park_data)
    end
  end

  def self.get_park_data(state)
    ParksService.find_park(state)
  end
end
