ActiveAdmin.register TaxRate do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :gst, :pst, :hst, :applicable
  #
  # or
  #
  # permit_params do
  #   permitted = [:gst, :pst, :hst, :applicable]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
