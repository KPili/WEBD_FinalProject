ActiveAdmin.register InventoryDetail do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :aroma, :flavor, :acidity, :country_of_origin, :on_sale, :inventory_id, :species_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:aroma, :flavor, :acidity, :country_of_origin, :on_sale, :inventory_id, :species_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
