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
    calculate_total
    @sale.save
    redirect_to @sale, method: :get
  end

  private

  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax)
  end

  def find_post
    @sale = Sale.find(params[:id])
  end

  def calculate_total
    @sale.total = (@sale.value * 100 - @sale.discount) / 100.0
    @sale.total *= 1.19 if @sale.tax != 0
  end
end
