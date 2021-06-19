class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do

  #空の投稿を保存できないようにする
  validates :image, :title, :describe

  # 300以上、9999999以下の整数を許可する
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "out of setting range"}

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :status_id, :delivery_id, :prefectures_id, :shipping_date_id, numericality: { other_than: 1, message: "can't be blank"}

  end
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :shipping_date
  has_one_attached :image
end
