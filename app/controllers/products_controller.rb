class ProductsController < ApplicationController
  def index
  end

  private
  def product_params
    params.require(:product).permit(:title, :describe, :category_id, :status_id, :delivery_id, :prefectures_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
end
