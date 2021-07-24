class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @product = Product.find(params[:product_id])
    @buy_address = BuyAddress.new
    move_to_index
    move_to_index_seller
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    @product = Product.find(params[:product_id])
    move_to_index
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:postal_code, :prefecture_id, :city, :street, :building, :tel).merge(
      user_id: current_user.id, product_id: params[:product_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path if !@product.buy.nil? && !(current_user.id == @product.user_id)
  end

  def move_to_index_seller
    redirect_to root_path unless current_user.id != @product.user_id
  end
end
