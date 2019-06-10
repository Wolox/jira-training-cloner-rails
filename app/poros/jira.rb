class Jira
  include HTTParty
  headers 'Accept' => 'application/json'
  headers 'Content-Type' => 'application/json'
  basic_auth Rails.application.secrets.jira[:username], Rails.application.secrets.jira[:password]

  def self.training(project, file_name, emails)
    project_id = create_project(project)
    import_cards(file_name, project_id)
    set_users(emails, project_id)
  end

  def self.create_project(body)
    res = post('https://wolox-support.atlassian.net/rest/api/2/project',
               body: base_project.merge(body).to_json)
    JSON.parse(res.body)['id']
  end

  def self.import_cards(file_name, project_id)
    post('https://wolox-support.atlassian.net/rest/api/2/issue/bulk',
         body: { issueUpdates: parse_file(file_name, project_id) }.to_json)
  end

  def self.set_users(emails, project_id)
    post("https://wolox-support.atlassian.net/rest/api/3/project/#{project_id}/role/10102",
         body: { user: emails.map(&method(:user_account_id)) }.to_json)
  end

  def self.user_account_id(email)
    res = get("https://wolox-support.atlassian.net/rest/api/3/user/search?query=#{email}")
    JSON.parse(res.body).first['accountId']
  end

  def self.base_project
    {
      leadAccountId: '5b5f4c49665a402d2a5a1c7d',
      url: 'https://wolox-support.atlassian.net/',
      projectTemplateKey: 'com.pyxis.greenhopper.jira:gh-simplified-kanban-classic',
      avatarId: 10_200,
      assigneeType: 'UNASSIGNED',
      projectTypeKey: 'software'
    }
  end

  def self.parse_file(file_url, project_id)
    file = HTTParty.get(file_url)
    data = JSON.parse file.body
    data['cards'].map do |card|
      {
        update: {},
        fields: { project: { id: project_id }, summary: card['name'],
                  description: card['desc'], issuetype: { id: 10_028 } }
      }
    end
  end
end
