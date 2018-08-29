class SalesController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  def index
    @sales = Sale.all
  end

  def show
  end

  def edit
  end

  def destroy
    @sale.destroy
    redirect_to sales_path
  end

  def update
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
  def find_post
    @sale = Sale.find(params[:id])
  end
end
