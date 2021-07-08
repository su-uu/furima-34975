class BuysController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @buy_address = BuyAddress.new
  end

  # def new
  #   @buy_address = BuyAddress.new
  # end

  def create
    @buy_address = BuyAddress.new(buy_params)
    # @product = Product.find(params[:product_id])
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      @product = Product.find(params[:product_id])
      render :index
    end
  end

  private
  def buy_params
    params.permit(:postal_code, :prefecture_id, :city, :street, :building, :tel, :product_id).merge(user_id: current_user.id)
  end
end