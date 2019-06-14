class Trainer < ApplicationRecord
  has_and_belongs_to_many :trainings

  validates :email, presence: true

  before_create :sync_jira_id

  private

  def sync_jira_id
    self.jira_id = Jira.user_account_id(email)
  end
end
