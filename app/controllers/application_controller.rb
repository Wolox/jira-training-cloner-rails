class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # i18n configuration. See: http://guides.rubyonrails.org/i18n.html
  before_action :set_locale
  auth = { username: 'francisco.iglesias@wolox.com.ar', password: '<insert-token-here>' }
  headers = {'Accept' => 'application/json', 'Content-Type' => 'application/json'}

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: locale }
  end

  # for devise to redirect with locale
  def self.default_url_options(options = {})
    options.merge(locale: I18n.locale)
  end

  def index; end

  def first_version_create
    # body = {
    #   description: 'Example Project description',
    #   leadAccountId: '5b5f4c49665a402d2a5a1c7d',
    #   url: 'https://wolox-support.atlassian.net/',
    #   projectTemplateKey: 'com.pyxis.greenhopper.jira:gh-simplified-kanban-classic',
    #   avatarId: 10200,
    #   name: 'Example',
    #   assigneeType: 'PROJECT_LEAD',
    #   projectTypeKey: 'software',
    #   key: 'EX'
    # }
    # HTTParty.post('https://wolox-support.atlassian.net/rest/api/2/project', basic_auth: auth, body: body, headers: headers)
  end

  def migrate_cards
    # file = File.open 'maquetado.json'
    # data = JSON.parse file
    # file.close
    # body = {
    #   issueUpdates: data['cards'].map do |card|
    #   return {
    #     update: {},
    #     fields: {
    #       project: {
    #         id: '<project_id>'
    #       },
    #       summary: card['name'],
    #       description: card['desc']
    #     }
    #   }
    # end
    # }
    # HTTParty.post('https://wolox-support.atlassian.net/rest/api/2/issue/bulk', basic_auth: auth, body: body, headers: headers)
  end

  def add_users_to_project
    # body = {
    #   user: [
    #     '<trainer_user_id>'
    #     '<trainee_user_id>'
    #   ]
    # }
    # HTTParty.post("https://wolox-support.atlassian.net//rest/api/3/project/#{project_id}/role/#{role_id}", basic_auth: auth, body: body, headers: headers)
  end
end
