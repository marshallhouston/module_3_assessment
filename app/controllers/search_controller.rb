class SearchController < ApplicationController

  def index
    results = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=city,distance,longName,phone,storeType&pageSize=10&apiKey=#{ENV['bestbuy_api_key']}")
    parsed_results = JSON.parse(results.body, symbolize_names: true)
    @stores = parsed_results[:stores].map do |raw_store|
      Store.new(raw_store)
    end
  end

  private

    def search_params
      params.permit(:zip_code)
    end
end
