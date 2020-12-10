class ParksController < ApplicationController

  def index
    state_park = get_json("/api/v1/parks?q=#{params[:state]}")
    @parks = state_park[:data].map do |park_data|
      Park.new(park_data)
    end
  end

  private

  def conn
    Faraday.new(url: 'https://developer.nps.gov') do |faraday|
      faraday.params['api_key'] = ENV['NPS_API_KEY']
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
