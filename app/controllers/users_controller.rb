class UsersController < ApplicationController

  layout 'devise', except: [:sign_out, :show, :edit, :confirmation]

  def confirmation
  end

  def index
    @users = User.new
  end

  def new
   
  end

  def check_user
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

  def sign_out
  end
  
end
