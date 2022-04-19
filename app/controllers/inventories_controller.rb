class InventoriesController < ApplicationController
  def index
    # @inventories = InventoryDetail.includes(:inventory).page(params[:page])
    @inventories = Inventory.page(params[:page])
  end

  def show
    @inventory = InventoryDetail.find(params[:id])
  end

  def search
    # Wild Card Search
    wc_search = "%#{params[:keywords]}%"
    @inventories_results = Inventory.where("item_name LIKE ?", wc_search)
  end
end
