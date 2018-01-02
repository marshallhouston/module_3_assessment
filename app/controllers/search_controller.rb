class SearchController < ApplicationController

  def index
    
  end

  private

    def search_params
      params.permit(:zip_code)
    end
end
