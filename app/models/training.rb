class Training
  include ActiveModel::AttributeAssignment
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :description, :key, :emails, :filename
  validates :name, :description, :key, :emails, :filename, presence: true
  validate :emails_array

  def initialize(*args)
    assign_attributes(Hash[args])
  end

  def create
    true
    # call jira api
  end

  def persisted?
    false
  end

  private

  def emails_array
    true
    # validate and replace emails string with array of strings
  end
end
