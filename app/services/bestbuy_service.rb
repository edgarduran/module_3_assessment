class BestbuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(:url => 'https://api.bestbuy.com/v1/') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      # faraday.headers['X-Mashape-Key'] = ENV["TRAIL_API_KEY"]
    end
  end


  def product_search(params)
    if params[:search].split(' ').size == 1
      parse_json(connection.get("products(search=#{params[:search]})?show=sku,name,salePrice,shortDescription,image,customerReviewAverage&format=json&pageSize=15&page=1&apiKey=ubhx8perq9r8xj9hukpe66xr"))
    else
      multi_word_search(params)
    end
  end

  def multi_word_search(params)
    words = params[:search].split(' ').map do |word|
      "search=" + word + "&"
    end.join
    search = words.slice(0..-2)
    binding.pry
    parse_json(connection.get("products(search=#{search})?show=sku,name,salePrice,shortDescription,image,customerReviewAverage&format=json&pageSize=3&page=1&apiKey=ubhx8perq9r8xj9hukpe66xr"))
  end

  private
  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
