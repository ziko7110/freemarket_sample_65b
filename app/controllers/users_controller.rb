class UsersController < ApplicationController

  layout 'devise'
  def index
 
  end

  def new
  @user = User.new(user_params)
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
  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :family_name_kanji,
      :first_name_kanji,
      :family_name_kana,
      :first_name_kana,
      :birth_year,
      :birth_month,
      :birth_day,
    )
  
end


end
