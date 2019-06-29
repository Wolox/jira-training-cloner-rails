class CreateTrainerTeches < ActiveRecord::Migration[5.1]
  def change
    create_table :trainer_teches do |t|
      t.belongs_to :trainer, index: true
      t.belongs_to :tech, index: true
      t.boolean :active
      t.boolean :trainer_to_be
      t.timestamps
    end
  end
end
