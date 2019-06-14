ActiveAdmin.register Training do
  permit_params :name, :description, :key, :trainee, :tech_id, trainer_ids: []
  index do
    selectable_column
    id_column
    column :name
    column :key
    actions
  end

  filter :name
  filter :key

  show do
    panel I18n.t('admin.training.details') do
      attributes_table_for training do
        row :name
        row :description
        row :link do
          link_to('Jira', "https://wolox-support.atlassian.net/browse/#{training.key}")
        end
        row :tech
        row :trainee
        list_row :trainers do
          training.trainers.pluck(:email)
        end
        row :created_at
        row :updated_at
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :key
      f.input :trainee
      f.input :trainer_ids, as: :tags, collection: Trainer.all, display_name: :email
      f.input :tech, as: :select, collection: Tech.all
    end
    f.actions
  end
end
