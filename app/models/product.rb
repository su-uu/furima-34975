class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  #空の投稿を保存できないようにする
  validates :title, :describe, :price, :image ,presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :status_id, :delivery_id, :prefectures_id, :shipping_date_id ,presence: true, numericality: { other_than: 1 }

  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :shipping_date
  has_one_attached :image
end
