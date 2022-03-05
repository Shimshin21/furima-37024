class BuyersController < ApplicationController



def index
  @item = Item.find(params[:item_id])
  @buyer_shipping_address = BuyerShippingAddress.new
end

def create
  @buyer_shipping_address = BuyerShippingAddress.new(buyer_params)
  if  
    @item = Item.find(params[:item_id])
    @buyer_shipping_address.valid?

    pay_item
    @buyer_shipping_address.save
    redirect_to root_path
  else
    @item = Item.find(params[:item_id])
    render :index
  end
end


private

def buyer_params
  params.require(:buyer_shipping_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :tell_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token]) 
end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: buyer_params[:token],    # カードトークン
    currency: 'jpy'                # (日本円）
  )
end

end


#@buyer_params[:price]



#item_id: params[:item]
#item_id: @item.id

#   4242424242424242