class UsersController < ApplicationController

  layout 'devise', except: [:sign_out, :show, :edit, :confirmation, :check_user]

  before_action :set_user, only: [:exhibiting, :trading, :sold]

  def confirmation
  end

  def index
    @users = User.new
  end

  def new
  @user = User.new
  
  end

  def create
  @user = User.new(user_params)
  @user.create
  end


  def exhibiting
    @buyeditems = @user.buyed_items
  end

  def trading
    @sellingitems = @user.selling_items
  end

  def sold
    @solditems = @user.sold_items
  end


  def check_user
  end
  
  def pay_jp

    
  end
  
  def edit
  end

  def show
  end

  def update
  end

  def sign_out
    
  end
  
  def item_params
    params.require(:item).permit(:name, :description, :price, :text, :brand, :condition, :delivery_fee, :prefecture_id, :shipping_days, :shipping_area, :price, :categoryname, :user_id, photos_attributes: [:image], brands_attributes: [:brandname])
  
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
