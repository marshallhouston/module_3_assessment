class Api::V1::ItemsController < Api::V1::BaseController
  before_action :set_item, only: [:show, :destroy]

  def index
    render json: Item.all
  end

  def show
    render json: @item
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item, status: :created
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @item
      @item.destroy
    else
      render status: :not_found
    end
  end

  private

    def set_item
      @item ||= Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:id, :name, :description, :image_url)
    end
end
