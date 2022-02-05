class ItemsController < ApplicationController

  def index
    #@items = Item.oredr("created_at DESC")
  end

  def new
    #@item = item.new
  end
  
  def create
    #Item.create(item_params)
  end

  private

  def items_params
    params.require(:item).permit(:prefecture_id, :category_id)
  end

end