ActiveAdmin.register Tech do
  permit_params :name, :url

  index do
    selectable_column
    id_column
    column :name
    column :url
    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :name
      f.input :url
    end
    f.actions
  end
end
