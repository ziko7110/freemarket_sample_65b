class SignupController < ApplicationController

  def new
    @user = User.new
    @user.user_address.build
  end

  def call_new
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password]
    session[:family_name_kanji] = user_params[:family_name_kanji]
    session[:first_name_kanji] = user_params[:first_name_kanji]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]
    @user = User.new 
    @user.user_address.build
  end

  def address_new
    session[:mobile_phone_number] = user_params[:mobile_phone_number]
    @user = User.new 
    @user.user_address.build
  end
  
  def pay_jp
  end
  
  def user_done
  end
  
  def create 
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name_kanji: session[:family_name_kanji],
      first_name_kanji: session[:first_name_kanji],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      mobile_phone_number: session[:mobile_phone_number],
      postal_code: user_params[:postal_code],
      prefecture: user_params[:prefecture],
      city:  user_params[:city],
      address_number: user_params[:address_number],
      building_name: user_params[:building_name],
      )
    @user.user_address.build(user_params[:user_address_attributes]["0"]) 
    @user.save
      redirect_to   pay_jp_new_signup_index_path
  end
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
      :mobile_phone_number,
      :postal_code,
      :prefecture,
      :city,
      :address_number,
      :building_name,
      :phone_number,
      user_address_attributes:[
      :family_name_kanji,
      :first_name_kanji,
      :family_name_kana,
      :first_name_kana,
      :postal_code,
      :prefecture,
      :city,
      :address_number,
      :building_name,
      :phone_number,
      ]
    )
  end
