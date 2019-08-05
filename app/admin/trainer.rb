ActiveAdmin.register Trainer do
  permit_params :email, :name,
                trainer_teches_attributes: %i[id _destroy tech_id active trainer_to_be]
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :trainer_teches { |trainer| trainer.trainer_teches.collect {|trainer_tech| trainer_tech.tech.name}.join(', ') }
    bool_column :trainer_to_be { |trainer| trainer.trainer_teches.any? { :trainer_to_be? } }
    bool_column :active { |trainer| trainer.trainer_teches.any? { :active? } }
    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.has_many :trainer_teches, allow_destroy: true do |tt| # TODO: change label
        tt.input :tech, as: :select, collection: Tech.all # TODO: change label
        tt.input :active, as: :boolean
        tt.input :trainer_to_be, as: :boolean
      end
    end
    f.actions
  end

  csv do
    column :name
    column :email
    column :trainer_teches { |trainer| trainer.trainer_teches.collect {|trainer_tech| trainer_tech.tech.name}.join(', ') }
    column :trainer_to_be { |trainer| trainer.trainer_teches.any? { :trainer_to_be? } ? 'Yes' : 'No' }
    column :active { |trainer| trainer.trainer_teches.any? { :active? } ? 'Yes' : 'No' }
  end
end
