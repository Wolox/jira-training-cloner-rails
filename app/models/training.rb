class Training < ApplicationRecord
  belongs_to :tech
  has_and_belongs_to_many :trainers

  before_create :jira_project
  validates :name, :description, :key, :tech_id, :trainee, presence: true

  private

  def jira_project
    Jira.training(project, tech.url, trainers, trainee)
  end

  def project
    { name: name, description: description, key: key }
  end
end
