require "test_helper"

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#index" do
    item = Item.create(
            name: "Test Item",
            description: "Item Desc",
            image_url: "Test.png"
          )
    get :index, format: :json

    items = JSON.parse(response.body)

    assert_response :success
    assert_equal "Test Item", items.first['name']
    assert_equal "Item Desc", items.first['description']
    assert_equal "Test.png", items.first['image_url']
    assert_equal 1, items.count
  end

  test "#show" do
    item = Item.create(
            name: "Test Item",
            description: "Item Desc",
            image_url: "Test.png"
          )

    get :show, format: :json, id: Item.last.id

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal "Test Item", item['name']
    assert_equal "Item Desc", item['description']
    assert_equal "Test.png", item['image_url']
  end

  test "#create" do
    assert_equal 0, Item.count
    post :create, format: :json, item: {name: "Test Item", description: "Item Desc", image_url: "Test.png"}

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal 1, Item.count
    assert_equal "Test Item", Item.first.name
    assert_equal "Item Desc", Item.first.description
    assert_equal "Test.png", Item.first.image_url
  end

  test "#destroy" do
    item = Item.create(
            name: "Test Item",
            description: "Item Desc",
            image_url: "Test.png"
          )

    assert_equal 1, Item.count

    delete :destroy, format: :json, id: Item.first.id
    
    assert_response :success
    assert_equal 0, Item.count
  end

end
