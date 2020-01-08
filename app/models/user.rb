class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,

          :recoverable, :rememberable, :validatable,
          :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  has_many :sns_credentials, dependent: :destroy


  has_many :items

  has_many :user_addresses
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"
  accepts_nested_attributes_for :user_addresses
  validates :nickname,:encrypted_password,:email,:family_name_kanji,:first_name_kanji,:family_name_kana,:first_name_kana,:birth_year,:birth_month,:birth_day,:mobile_phone_number,   presence: true
  validates :email, uniqueness: true
  validates :family_name_kana,:first_name_kana, presence: true, format: { with: /\p{katakana}/, \
  message: 'には日本語を含めてください。(Text must contain katakana.)' }

  def self.without_sns_data(auth)
    user = User.find_by(email: auth.info.email)

      if user.present?
        sns = SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user.id
        )
      else
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email,
        )
        sns = SnsCredential.new(
          uid: auth.uid,
          provider: auth.provider
        )
      end
      return { user: user ,sns: sns}
    end

   def self.with_sns_data(auth, snscredential)
    user = User.find_by(id: snscredential.user_id)
    unless user.present?
      user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
      )
    end
    return {user: user}
   end

   def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.find_by(uid: uid, provider: provider)
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
    end
    return { user: user ,sns: sns}
  end
end

