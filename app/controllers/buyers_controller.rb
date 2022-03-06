class BuyersController < ApplicationController
  before_action :authenticate_user!


  #indexにデータが購入されていたら、トップページに遷移させる
  #ログイン状態の場合でも、自身が出品していない売却済み商品の商品購入ページへ遷移しようとすると、トップページに遷移すること。




  def index
  item_info
  if @item.shipping_address.present? || current_user.id == @item.user_id
    redirect_to root_path
  else
    @buyer_shipping_address = BuyerShippingAddress.new
  end
end












def create
  @buyer_shipping_address = BuyerShippingAddress.new(buyer_params)
  item_info
  if @buyer_shipping_address.valid?
    pay_item
    @buyer_shipping_address.save
    redirect_to root_path
  else
    render :index
  end
end

private

def buyer_params
  params.require(:buyer_shipping_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :tell_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token]) 
end

def item_info
  @item = Item.find(params[:item_id])
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


#   4242424242424242