class ItemsController < ApplicationController

  layout 'devise', only: [:new, :buy_confirmation]

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.photos.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def buy_confirmation
  end

end

private

def item_params
  params.require(:product).permit(:name, :price, images_attributes: [:image])

end
