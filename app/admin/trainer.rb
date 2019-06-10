ActiveAdmin.register Trainer do
  permit_params :name, :email

  index do
    selectable_column
    id_column
    column :name
    column :email
    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
    end
    f.actions
  end
end
