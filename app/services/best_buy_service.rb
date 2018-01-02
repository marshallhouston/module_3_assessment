class BestBuyService

  def initialize
    @conn = Faraday.new(url: 'https://api.bestbuy.com')
  end

  def find_all_stores(zip_code)
    response = conn.get "/v1/stores(area(#{zip_code},25))", base_filter
    parsed_results = JSON.parse(response.body, symbolize_names: true)

    # parsed_results[:stores].map do |raw_store|
    #   Store.new(raw_store)
    # end
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
