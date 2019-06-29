class AddNameToTrainer < ActiveRecord::Migration[5.1]
  def change
       add_column :trainers, :name, :string
  end
end
