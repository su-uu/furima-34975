class BuysController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    @product = Product.find(params[:product_id])
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      @product = Product.find(params[:product_id])
      render :index
    end
  end

  private
  def buy_params
    params.permit(:postal_code, :prefecture_id, :city, :street, :building, :tel, :product_id).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @product.price,
        card: buy_params[:token],
        currency: 'jpy'
      )
    end
end