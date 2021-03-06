class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true do
    validates :nickname
    validates :last_name,format:{ with: /\A[ぁ-んァ-ン一-龥々ー]/}
    validates :first_name,format:{ with: /\A[ぁ-んァ-ン一-龥々ー]/}
    validates :last_name_kana,format:{ with:/\A[ァ-ヶー－]+\z/}
    validates :first_name_kana,format:{ with:/\A[ァ-ヶー－]+\z/}
    validates :birthday
    validates :password, length: { minimum: 6 },format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
    validates :email
  end
end

