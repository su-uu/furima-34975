class BuysController < ApplicationController
  def index
  end

  def create
    @buy = Buy.new(buy_params)

  end

  # private
  # def buy_params
  #   param.require(:buy).permit(:)

end
