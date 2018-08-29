class SalesController < ApplicationController

  def new
  end

  def create
    redirect_to sales_new_path
  end

end
