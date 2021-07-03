class BuyAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :street, :building, :tel, :user_id

  with_options presence: true do
    # 3桁の数字と「-」と4桁の数字の組み合わせ以外保存できないようにする
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

    # ジャンルの選択が「---」の時は保存できないようにする
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

    # 空の投稿を保存できないようにする
    validates :city, :street, :tel, :user_id
  end

  def save
    buy = buy.create(user_id: user_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, street: street, tel: tel, buy_id: buy.id)
  end

end
