class SignupController < ApplicationController

  def new
    @user = User.new
  end

  def call_new
    

  end

  def address_new

  end

  def pay_jp
    
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
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
