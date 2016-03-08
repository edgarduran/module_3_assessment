require './test/test_helper'
require './app/services/bestbuy_service'

class BestbuyServiceTest < ActiveSupport::TestCase
  def setup
    Capybara.app = Storedom::Application
  end
  
  test "#product_search" do
    result = bestbuy_service.product_search("sennheiser")
    assert_equal 15, result[:products].count
  end

  test "#multi_word_search" do
    assert_equal 1, service.total_followers
  end


  def bestbuy_service
    BestbuyService.new
  end

end
