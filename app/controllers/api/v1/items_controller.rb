class Api::V1::ItemsController < Api::V1::BaseController

  def index
    render json: Item.all
  end
end
