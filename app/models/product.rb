class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    # 空の投稿を保存できないようにする
    validates :image, :title, :describe, :price

    # ジャンルの選択が「---」の時は保存できないようにする
    validates :category_id, :status_id, :delivery_id, :prefecture_id, :shipping_date_id,
              numericality: { other_than: 1, message: "can't be blank" }
  end

  # priceが半角数字の場合のみ許可する
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }

  # priceが300以上、9,999,999以下の整数を許可する
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'out of setting range' }

  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :shipping_date
  has_one_attached :image
end
