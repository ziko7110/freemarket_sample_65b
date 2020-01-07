class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_address
  accepts_nested_attributes_for :user_address
  validates :nickname,:encrypted_password,:email,:family_name_kanji,:first_name_kanji,:family_name_kana,:first_name_kana,:birth_year,:birth_month,:birth_day,:mobile_phone_number,   presence: true
  validates :email, uniqueness: true
  validates :family_name_kana,:first_name_kana, presence: true, format: { with: /\p{katakana}/, \
  message: 'には日本語を含めてください。(Text must contain katakana.)' }
  # validates :mobile_phone_number, format: {with: /\A[0-9]{3}-[0-9]{4}-[0-9]{4}\z/}
  # validates :email, format: { with: /\A[a-zA-Z]+\z/}
end

