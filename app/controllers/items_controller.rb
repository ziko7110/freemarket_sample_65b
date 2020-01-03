class ItemsController < ApplicationController

  def index
    @item = Item.includes(:images).order('created_at DESC')
    @item = Item.new
  end

  def new
    @item = Item.new
    @item.images.new
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

end

private

def item_params
  params.require(:product).permit(:name, :price, images_attributes: [:image])
end
