class Admin::SalesController < ApplicationController
  
  def index
  end
  
  def new
    @sales = Sale.new
  end

end
