class ParksService

  def self.find_park(state)
    get_json("/api/v1/parks?q=#{state}")
  end

  def self.conn
    private
    Faraday.new(url: 'https://developer.nps.gov') do |faraday|
      faraday.params['api_key'] = ENV['NPS_API_KEY']
    end
  end

  def self.get_json(url)
    private
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
