class Product < ApplicationRecord
  validates :title            ,presence: true
  validates :describe         ,presence: true
  validates :category_id      ,presence: true
  validates :status_id        ,presence: true
  validates :delivery_id      ,presence: true
  validates :prefectures_id   ,presence: true
  validates :shipping_date_id ,presence: true
  validates :price            ,presence: true
  validates :image            , presence: true

  belongs_to :user
  has_one_attached :image
end
