class CreateJoinTableTrainingTrainer < ActiveRecord::Migration[5.1]
  def change
    create_join_table :trainings, :trainers
  end
end
