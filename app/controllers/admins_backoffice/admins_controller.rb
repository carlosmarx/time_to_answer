class AdminsBackoffice::AdminsController < AdminsBackoffice::AdminController
  def index
    @admins = Admin.all
  end
end
