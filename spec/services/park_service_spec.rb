require 'rails_helper'

describe 'Parks Service', :vcr do
  it 'can return a movie' do
    parks = ParksService.find_park("Utah")
    park = parks[:data].first

    expect(park).to be_a(Hash)

    expect(park).to have_key(:fullName)
    expect(park[:fullName]).to be_a(String)

    expect(park).to have_key(:description)
    expect(park[:description]).to be_a(String)

    expect(park).to have_key(:directionsInfo)
    expect(park[:directionsInfo]).to be_a(String)

    expect(park).to have_key(:operatingHours)
    expect(park[:operatingHours]).to be_a(Array)
  end
end
