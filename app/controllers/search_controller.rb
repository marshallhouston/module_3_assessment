class SearchController < ApplicationController

  def index
    @stores = BestBuyStoresPresenter.new(search_params[:zip_code]).all_stores
    # @stores = service.find_all_stores(search_params[:zip_code])
  end

  private

    def search_params
      params.permit(:zip_code)
    end

    def service
      @service ||= BestBuyService.new
    end
end
