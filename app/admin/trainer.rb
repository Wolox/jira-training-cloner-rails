ActiveAdmin.register Trainer do
  permit_params :email, :name,
                trainer_teches_attributes: %i[id _destroy tech_id active trainer_to_be]
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
      f.input :name
      f.has_many :trainer_teches, allow_destroy: true do |tt| # TODO: change label
        tt.input :tech, as: :select, collection: Tech.all # TODO: change label
        tt.input :active
        tt.input :trainer_to_be
      end
    end
    f.actions
  end
end
