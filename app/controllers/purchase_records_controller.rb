class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_to_root
  before_action :set_items, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @shipping_address_purchase_record = ShippingAddressPurchaseRecord.new
  end

  def create
    @item = Item.find(params[:item_id])
    @shipping_address_purchase_record = ShippingAddressPurchaseRecord.new(shipping_address_purchase_record_params)
    if @shipping_address_purchase_record.valid?
      pay_item
      @shipping_address_purchase_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def shipping_address_purchase_record_params
    params.require(:shipping_address_purchase_record).permit(:postal_code, :prefecture_id, :municipality, :address, :building_number, :tel).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: shipping_address_purchase_record_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def redirect_to_root
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user.id
  end

  def set_items
    @item = Item.find(params[:id])
  end
end
