class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show, :index]



  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end


  def update
    if @item.update(items_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  
  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path

    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end


  def set_item
    @item = Item.find(params[:id])
  end

  private

  def items_params
    params.require(:item).permit(:image, :name, :description, :price, :prefecture_id, :category_id, :item_condition_id,
                                 :shipping_cost_id, :shipping_days_id).merge(user_id: current_user.id)
  end
end
