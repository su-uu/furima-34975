class BuyAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street, :building, :tel, :user_id, :product_id, :token

  with_options presence: true do
    # 3桁の数字と「-」と4桁の数字の組み合わせ以外保存できないようにする
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    
    # 空の投稿を保存できないようにする
    validates :city, :street, :tel, :user_id, :token
  end
  
  # ジャンルの選択が「---」の時は保存できないようにする
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  def save
    buy = Buy.create!(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building: building, tel: tel, buy_id: buy.id)
  end

end
