ActiveAdmin.register Trainer do
  permit_params :email

  index do
    selectable_column
    id_column
    column :email
    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :email
    end
    f.actions
  end
end
