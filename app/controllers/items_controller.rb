class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_items, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_root, only: [:edit, :update]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item =  Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end  
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :status_id, :delivery_charge_id, :prefecture_id,
                                 :day_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_items
    @item = Item.find(params[:id])
  end

  def redirect_to_root
    redirect_to root_path if current_user.id != @item.user.id
  end
end
