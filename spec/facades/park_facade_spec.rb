require "rails_helper"

RSpec.describe "Park Facade", :vcr do
  it "can get park data" do
    parks = ParkFacade.find_park("Utah")
    park = parks.first

    expect(park).to be_a(Park)
    expect(park.name).to eq("Arches National Park")
    expect(park.description.class).to eq(String)
    expect(park.directions.class).to eq(String)
    expect(park.hours.class).to eq(Hash)
  end
end
