class ItemsController < ApplicationController

  layout 'devise', only: [:new, :buy_confirmation]

  before_action :set_user, only: [:exhibiting, :trading, :sold]

  def index
    @items = Item.all.joins(:photos).group("item_id").order('id DESC')

  end

  def new
    @item = Item.new
    @item.photos.new
    @item.brands.new
  end

  def show
    @item = Item.find(params[:id])
    @brand = @item.brands
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to new_item_path
    else
      render new_user_path
    end
  end

  def exhibiting
    @buyedphotos = @item.buyed_items
  end

  def trading
    @sellingitem = @item.selling_items
  end

  def sold
    @solditem = @item.sold_items
  end

  def get_delivery_method
  end 

  def edit
  end

  def update
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  def buy_confirmation
  end

  def exhibiting
  end

  def sold
  end

  def trading
  end

end

private

  def item_params
    params.require(:item).permit(:name, :description, :price, :text, :brand, :condition, :delivery_fee, :prefecture_id, :shipping_days, :shipping_area, :price, :categoryname, :user_id, photos_attributes: [:image], brands_attributes: [:brandname]).merge(user_id: current_user.id)

  end

  def set_user
    @user = User.find(params[:id])
  end

