require 'sinatra'
require_relative 'models/product.rb'

get '/' do
  # HOME LANDING PAGE SHOWING BANNER PHOTO, TITLE, AND SUBTITLE
  @page_title = "Home"
  erb :index
end


get '/team' do
  # TEAM PAGE LISTING THE TEAM MEMBERS
  @page_title = "Team"
  erb :team
end

get '/products' do
  # PRODUCTS PAGE LISTING ALL THE PRODUCTS
  @page_title = "Productos"
  @products = Product.sample_locations
  erb :products
end

get '/products/location/:location' do
  # PAGE DISPLAYING ALL PHOTOS FROM ONE LOCATION
  @page_title = "Product location"
  @products = Product.find_by_location(params[:location])
  erb :product_location
end

get '/products/:id' do
  # PAGE DISPLAYING ONE PRODUCT WITH A GIVEN ID
  @page_title = "Product id"
  @product = Product.find(params[:id])
  erb :product_id
end

get '/deals' do
  # PAGE DISPLAYING ALL PHOTOS FROM ONE LOCATION
  @page_title = "Deals"
  @products = Product.deals
  erb :deals
end