class Trainer < ApplicationRecord
  has_and_belongs_to_many :trainings
  has_many :trainer_teches, dependent: :destroy
  has_many :teches, :through => :trainer_teches

  validates :email, presence: true
  validates :name, presence: true

  before_create :sync_jira_id

  accepts_nested_attributes_for :trainer_teches

  def active?
    trainer_teches.any?(&:active)
  end

  private

  def sync_jira_id
    self.jira_id = Jira.user_account_id(email)
  end
end
