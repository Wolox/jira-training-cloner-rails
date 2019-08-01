class OrganizationManager
  @@instance = Github.new basic_auth:
  "#{Rails.application.secrets.github[:username]}:#{Rails.application.secrets.github[:password]}",
  org: 'wolox-training'

  def self.create_repository(name)
    @@instance.repos.create name: name
  end
end
