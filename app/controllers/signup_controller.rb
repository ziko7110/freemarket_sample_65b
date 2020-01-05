class SignupController < ApplicationController

  def new
    @user = User.new

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
   
  end

  def address_new
    session[:mobile_phone_number] = user_params[:mobile_phone_number]
    @user = User.new 
  end

  # def pay_jp
  #   session[:family_name_kanji] = user_params[:family_name_kanji]
  #   session[:first_name_kanji] = user_params[:first_name_kanji]
  #   session[:family_name_kana] = user_params[:family_name_kana]
  #   session[:first_name_kana] = user_params[:first_name_kana]
  #   session[:postal_code] = user_params[:postal_code]
  #   session[:prefecture] = user_params[:prefecture]
  #   session[:city] = user_params[:city]
  #   session[:address_number] = user_params[:address_number]
  #   session[:building_name] = user_params[:building_name]
  #   session[:phone_number] = user_params[:phone_number]
  #   @user = User.new 
  # end

  def done
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
    # family_name_kanji: session[:family_name_kanji],
    # first_name_kanji: session[:first_name_kanji],
    # family_name_kana: session[:family_name_kana],
    # first_name_kana: session[:first_name_kana],
    # postal_code: session[:postal_code],
    # prefecture: session[:prefecture],
    # city: session[:city],
    # address_number: session[:address_number],
    # building_name: session[:building_name],
    # phone_number:session[:phone_number],

    # family_name_kanji: user_params[:family_name_kanji],  
    # first_name_kanji:  user_params[:first_name_kanji],
    # family_name_kana: user_params[:family_name_kana],
    # first_name_kana: user_params[:first_name_kana],
    postal_code: user_params[:postal_code],
    prefecture: user_params[:prefecture],
    city:  user_params[:city],
    address_number: user_params[:address_number],
    building_name: user_params[:building_name],
    # phone_number: user_params[:phone_number],
    )
 
    @user_address = UserAddress.new(
    family_name_kanji: session[:family_name_kanji],
    first_name_kanji: session[:first_name_kanji],
    family_name_kana: session[:family_name_kana],
    first_name_kana: session[:first_name_kana],
    postal_code: user_params[:postal_code],
    prefecture: user_params[:prefecture],
    city:  user_params[:city],
    address_number: user_params[:address_number],
    building_name: user_params[:building_name],
    phone_number: user_params[:phone_number]
    )

  binding.pry
  @user.save
  binding.pry
  @user_address.save!
  redirect_to root_path
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
      :family_name_kanji,
      :first_name_kanji,
      :family_name_kana,
      :postal_code,
      :city,
      :address_number,
      :building_name,
      :phone_number,
      :prefecture
    )
end
