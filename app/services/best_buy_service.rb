class BestBuyService

  def initialize
    @conn = Faraday.new(url: 'https://api.bestbuy.com')
  end

  def find_all_stores(zip_code)
    response = conn.get "/v1/stores(area(#{zip_code},25))", base_filter
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :conn, :base_filter

    def base_filter
      {
        format: 'json',
        show: 'city,distance,longName,phone,storeType',
        pageSize: 10,
        apiKey: ENV['bestbuy_api_key']
      }
    end

end
