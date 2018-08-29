class SalesController < ApplicationController

  def index
    @sales = Sale.all
  end
  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    @sale.save
    redirect_to sales_path
  end

  private
    def sale_params
      params.require(:sale).permit(:detail, :category, :value, :discount, :tax)
    end
end
