class AdminsBackoffice::AdminsController < AdminsBackoffice::AdminController
    before_action :set_admin, only: [:edit]
    
    def index
    @admins = Admin.all
  end

  def edit
  end
  
  def update
  end
  
  private
    def set_admin
        @admin = Admin.find(params[:id])
    end
    
end
