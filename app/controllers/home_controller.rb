class HomeController < ApplicationController
  def index
    @inventory_details = InventoryDetail.includes(:inventory).all
  end
end
