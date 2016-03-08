class SearchController < ApplicationController

  def index
    @products = bestbuy_service.products
  end

  def bestbuy_service
    BestbuyService.new
  end

end
