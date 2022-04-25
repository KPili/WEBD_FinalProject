class CartController < ApplicationController
  # Add cart contents - Data will be sent as form data (params)
  # POST /cart
  def create
    id = params[:id].to_i # Take the id taken for inventory item and convert to integer

    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id # Append the id to the shopping_cart session
      redirect_to inventories_path # route the user back to the home page
    end
  end

  # Remove cart contents
  # DELETE /cart/:id
  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    redirect_to inventories_path
  end
end
