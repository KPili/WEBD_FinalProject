ActiveAdmin.register Inventory do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :item_name, :unit_sold, :unit_price, :stock_amount, :new_inventory, :total,
                :retail_total, :supplier_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:item_name, :unit_sold, :unit_price, :stock_amount, :new_inventory, :total, :retail_total, :supplier_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
