class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @product = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :describe, :category_id, :status_id, :delivery_id, :prefecture_id,
                                    :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
