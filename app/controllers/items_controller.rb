class ItemsController < ApplicationController

  def index
    #@items = Item.oredr("created_at DESC")
  end

  def new
    @item =Item.new
  end
  
  def create
    @item =Item.create(items_params)
  end

  private

  def items_params
    params.require(:item).permit(:image, :name, :description, :price, :prefecture_id, :category_id, :item_condition_id, :shipping_cost_id, :shipping_days_id).merge(user_id: current_user.id)
  end

end



#if item.create(items_params)
  #redirect_to root_path
  #render : edit
#end