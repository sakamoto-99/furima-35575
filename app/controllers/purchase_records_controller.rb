class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @shipping_address_purchase_record = ShippingAddressPurchaseRecord.new
  end

  def create
    @item = Item.find(params[:item_id])
    @shipping_address_purchase_record = ShippingAddressPurchaseRecord.new(purchase_record_params)
    if @shipping_address_purchase_record.valid?
      # binding.pry
      @shipping_address_purchase_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:shipping_address_purchase_record).permit(:postal_code, :prefecture_id, :municipality, :address, :building_number, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end



end
