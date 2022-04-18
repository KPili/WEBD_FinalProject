class HomeController < ApplicationController
  def index
    @inventory_details = Inventory.where("new_inventory == 1").limit(8)
  end
end
