class SalesController < ApplicationController

  def index
    @sales = Sale.all
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    redirect_to sales_path
  end

  def update
    @sale = Sale.find(params[:id])
    @sale.update(sale_params)
    redirect_to sales_path
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
