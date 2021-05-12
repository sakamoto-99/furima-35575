class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product =  Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:image, :title, :description, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end

end
