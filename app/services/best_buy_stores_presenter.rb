class BestBuyStoresPresenter

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def all_stores
    best_buy_service.find_all_stores(zip_code)[:stores].map do |raw_store|
      Store.new(raw_store)
    end
  end

  private
    attr_reader :zip_code

    def best_buy_service
      @best_buy_service ||= BestBuyService.new
    end
end
