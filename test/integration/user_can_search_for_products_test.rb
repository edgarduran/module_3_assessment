require "test_helper"

class UserCanSearchForProductsTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end

  test "user can search bestbuy api fora product" do
    visit "/"

    within ".bb-search" do
      fill_in 'Search', :with => 'sennheiser'
      click_on "Search"
    end

    assert page.has_content? "Name: Galaxy Audio"
  end


end
