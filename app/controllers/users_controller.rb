class UsersController < ApplicationController

  layout 'devise'
  def index
 
  end

  def new
  @user = User.new
  
  end

  def create
  @user = User.new(user_params)
  @user.create

  end
  
  def call_new

  end

  def pay_jp
    
  end

  def address_new

  end

  def user_done

  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
  


end
