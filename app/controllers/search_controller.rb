class SearchController < ApplicationController

  def index
    @stores = store_presenter.all_stores
    @total_stores = store_presenter.total_stores
  end

  private
    attr_reader :store_presenter

    def search_params
      params.permit(:zip_code)
    end

    def store_presenter
      BestBuyStoresPresenter.new(search_params[:zip_code])
    end

end
