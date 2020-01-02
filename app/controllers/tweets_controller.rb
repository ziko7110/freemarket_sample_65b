class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @address = Prefecture.all
  end

  def card
  end

  def update
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
