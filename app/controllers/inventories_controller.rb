class InventoriesController < ApplicationController
  def index
    @inventories = InventoryDetail.includes(:inventory).all
  end

  def show
    @inventory = InventoryDetail.find(params[:id])
  end
end
