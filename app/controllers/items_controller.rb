class ItemsController < ApplicationController

  layout 'devise', only: [:new, :edit, :buy_confirmation]

  def index
    @items = Item.joins(:photos).group("item_id").order('id DESC')
  end

  def new
    @item = Item.new
    @photo = @item.photos.new
    @brand = @item.brands.new
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
      render :new
    end
  end

  def get_delivery_method
  end 

  def edit
    @item = Item.find(params[:id])
    @photos = @item.photos
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
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
  
