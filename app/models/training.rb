class Training
  include ActiveModel::AttributeAssignment
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :description, :key, :trainer_email, :trainee_email, :training_url
  validates :name, :description, :key,
            :trainer_email, :trainee_email, :training_url, presence: true

  def initialize(*args)
    assign_attributes(Hash[args])
  end

  def create
    Jira.training(project, training_url, emails)
  end

  def persisted?
    false
  end

  private

  def project
    { name: name, description: description, key: key }
  end

  def emails
    trainer_email.split(',').map{|email| email.strip }.concat([trainee_email])
  end
end
