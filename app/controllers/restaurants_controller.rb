class RestaurantsController < ApplicationController

  before_action :find_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.sorted_by_ratings
  end

  def show
    @review = Review.new
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end