ActiveAdmin.register Inventory do
  permit_params :item_name, :unit_sold, :unit_price, :stock_amount, :new_inventory, :total,
                :retail_total, :supplier_id, :image

  # DSL - Domain Specific Language
  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.actions         # adds the 'Submit' and 'Cancel' buttons
    f.inputs do
      f.input :image, as:   :file,
                      hint: f.object.image.present? ? image_tag(f.object.image, width: "200") : ""
    end
  end
end
