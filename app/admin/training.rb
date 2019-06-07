ActiveAdmin.register_page 'Trainings' do
  menu false

  page_action :new do
    @training = Training.new
    render :new, layout: 'active_admin'
  end

  page_action :create, method: :post do
    args = params.require(:training).permit(:name, :description, :key, :filename, :emails)
    @training = Training.new(*args.to_h)
    if @training.create
      redirect_to admin_dashboard_path,
                  notice: 'Training successfully created' # TODO: add I18n
    else
      @training.validate
      render :new, layout: 'active_admin'
    end
  end
end
