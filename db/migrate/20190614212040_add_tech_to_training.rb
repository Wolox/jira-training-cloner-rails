class AddTechToTraining < ActiveRecord::Migration[5.1]
  def change
    add_reference :trainings, :tech, foreign_key: true
  end
end
