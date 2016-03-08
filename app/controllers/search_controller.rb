class SearchController < ApplicationController

  def index
    @products = bestbuy_service.product_search(params)
  end

  private
  def bestbuy_service
    BestbuyService.new
  end

end
