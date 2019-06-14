class AddJiraIdToTrainers < ActiveRecord::Migration[5.1]
  def change
    add_column :trainers, :jira_id, :string
  end
end
