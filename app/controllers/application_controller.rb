class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart

  # Methods for shopping cart using sessions

  private

  # Initialize a new shopping cart
  def initialize_session
    session[:shopping_cart] ||= [] # On initial visit, shopping cart is empty
  end

  # Helper Method to retrieve a collection of products from a collection
  def cart
    Inventory.find(session[:shopping_cart])
  end
end
