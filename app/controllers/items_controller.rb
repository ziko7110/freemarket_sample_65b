class ItemsController < ApplicationController

  layout 'devise', only: [:new, :confirmation]

  def index
    @items = Item.all.order(created_at: "DESC")
  end

end
