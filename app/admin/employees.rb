ActiveAdmin.register Employee do
  permit_params :f_name, :l_name, :phone_num, :email, :job_id

  # DSL - Domain Specific Language
  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.actions         # adds the 'Submit' and 'Cancel' buttons
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image) : ""
    end
  end
end
