class CreateTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :trainings do |t|
      t.string :name
      t.text :description
      t.string :key
      t.string :trainee

      t.timestamps
    end
  end
end
