class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, presence: true
    # 半角英数字が含まれる６字以上の場合のみ許可する
    validates :password,
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers.' }

    # ひらがな、カタカナ、漢字のみ許可する
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' }

    # カタカナのみ許可する
    validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.' }

    validates :birthday, presence: true
  end
end

# passwordのバリデーションの設定は下記の表記でも可能
# validate :password_complexity
# def password_complexity
#   return if password = /[a-z][\d]/
#   errors.add :password, 'is invalid. Include both letters and numbers.'
# end
