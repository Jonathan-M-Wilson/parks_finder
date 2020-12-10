require "rails_helper"

RSpec.describe Park do
  it "exists with attributes", :vcr do

    json_park_data = File.read('spec/fixtures/poros/zions_park_utah.json')

    park_data = JSON.parse(json_park_data, symbolize_names: true)

    park = Park.new(park_data)

    expect(park).to be_a Park
    expect(park.hours.class).to eq(Hash)
    expect(park.description.class).to eq(String)
    expect(park.name).to eq("Zion National Park")
    expect(park.directions).to eq("Zion National Park is located on State Route 9 in Springdale, Utah.")
  end
end
