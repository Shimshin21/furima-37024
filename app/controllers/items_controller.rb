class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(items_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def items_params
    params.require(:item).permit(:image, :name, :description, :price, :prefecture_id, :category_id, :item_condition_id,
                                 :shipping_cost_id, :shipping_days_id).merge(user_id: current_user.id)
  end
end
