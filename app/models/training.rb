class Training
  include ActiveModel::AttributeAssignment
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :description, :key, :trainer_email, :trainee_email, :training
  validates :name, :description, :key,
            :trainer_email, :trainee_email, :training, presence: true

  def initialize(*args)
    assign_attributes(Hash[args])
  end

  def create
    Jira.training(project, training, emails)
  end

  def persisted?
    false
  end

  private

  def project
    { name: name, description: description, key: key }
  end

  def emails
    trainer_email.split(',').map(&:strip).push(trainee_email)
  end
end
