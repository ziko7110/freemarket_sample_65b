class ItemsController < ApplicationController

  layout 'devise', only: [:new, :edit, :buy_confirmation]

  before_action :set_user, only: [:exhibiting, :trading, :sold]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.joins(:photos).group("item_id").order('id DESC')

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
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      # @item = Item.find(params[:id])
      @photos = @item.photos
    else
      redirect_to root_path
    end
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
    @item = Item.find(params[:id])
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  # def exhibiting
  # end

  # def sold

  # end

  # def trading
  
  # end

end

private


  def item_params
    params.require(:item).permit(:name, :description, :price, :text, :brand, :condition, :delivery_fee, :prefecture_id, :shipping_days, :shipping_area, :price, :categoryname, :user_id, photos_attributes: [:image], brands_attributes: [:brandname]).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:id])
  end
