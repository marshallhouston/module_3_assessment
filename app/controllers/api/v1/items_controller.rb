class Api::V1::ItemsController < Api::V1::BaseController
  before_action :set_item, only: [:show, :destroy]

  def index
    render json: Item.all
  end

  def show
    render json: @item
  end

  def destroy
    if @item
      @item.destroy
      render json: { status: 204 }
      # render json: { head: :no_content }
    else
      render json: {status: :not_found}
    end
  end

  private

    def set_item
      @item ||= Item.find(params[:id])
    end
end
