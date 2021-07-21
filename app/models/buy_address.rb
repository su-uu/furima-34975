class BuyAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street, :building, :tel, :user_id, :product_id, :token

  with_options presence: true do
    # postal_codeが「-」がないと保存できないようにする
    validates :postal_code, format: { with: /-/, message: 'is invalid. Include hyphen(-)' }

    # Telが半角数字以外保存できないようにする
    validates :tel, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input only number' }

    # 空の投稿を保存できないようにする
    validates :city, :street, :user_id, :token
  end

  # postal_codeが半角数字3桁、ハイフン、数字4桁の並び以外保存できないようにする
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }

  # 11桁または10桁以内の数字以外保存できないようにする
  validates :tel, format: { with: /\A[0-9０-９]{10,11}\z/, message: 'is too short' }

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    buy = Buy.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building: building,
                   tel: tel, buy_id: buy.id)
  end
end
