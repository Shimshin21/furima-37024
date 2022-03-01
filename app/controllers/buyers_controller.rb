class BuyersController < ApplicationController

def index
  @item = Item.find(params[:item_id])
end

def new
  @buyer_shipping_address = BuyerShippingAddress.new
end


def create
  @buyer_shipping_address = BuyerShippingAddress.new(buyer_params)
  if  @buyer_shipping_address.valid?
    @buyer_shipping_address.save
    redirect_to root_path
  else
    render :new
  end
end

private

def buyer_params
  params.require(:buyer_shipping_address).permit(:post_code, :prefecture, :city, :address, :building_name, :tell_number).merge(user_id: current_user.id)
end


#def set_prototype
  #@item = Item.find(params[:id])
#end

#def address_params
  #params.permit(:postal_code, :prefecture, :city, :address, :building_name, :tell_number, :shipping_address).merge(buyer_id: @buyer.id)
#end

end