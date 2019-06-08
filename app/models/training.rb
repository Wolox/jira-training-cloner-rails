class Training
  include ActiveModel::AttributeAssignment
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :description, :key, :trainer_email, :trainee_email, :training_url
  validates :name, :description, :key, :trainer_email, :trainee_email, :training_url, presence: true
  validate :emails_array

  def initialize(*args)
    assign_attributes(Hash[args])
  end

  def create
    # true
    Jira.todo({ name: name, description: description, key: key }, training_url, emails_array)
  end

  def persisted?
    false
  end

  private

  def emails_array
    true
    [trainee_email, trainer_email]
  end
end
