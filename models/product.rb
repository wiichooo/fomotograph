require 'HTTParty'
require 'json'

class Product
  attr_reader :id, :title, :location, :summary, :url, :price

  # ping the API for the product JSON
  url = 'https://fomotograph-api.udacity.com/products.json'
  DATA = HTTParty.get(url)['photos']

  LOCATIONS = ['canada', 'england', 'france', 'ireland', 'mexico', 'scotland', 'taiwan', 'us']


  # initialize a Product object using a data hash
  def initialize(product_data = {})
    @id = product_data['id']
    @title = product_data['title']
    @location = product_data['location']
    @summary = product_data['summary']
    @url = product_data['url']
    @price = product_data['price']
  end

  # return an array of Product objects
  def self.all
    DATA.map { |product| new(product) }
  end

  def self.sample_locations
    @products = []
    LOCATIONS.each do |location|
      @products.push self.all.select { |product| product.location == location }.sample
    end
    return @products
  end

  def self.find_by_location(loc)
    
    @products = self.all.select { |product| product.location == loc}

    return @products
  end

  def self.find(id)
    return self.all.select { |product| product.id == id.to_i }.first
  end

  def self.deals
    return self.all.select { |product| product.price <= 10 }
  end

end