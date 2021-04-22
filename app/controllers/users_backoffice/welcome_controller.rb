class UsersBackoffice::WelcomeController < UsersBackoffice::UsersController
  def index
    @user_statistiscs  = UserStatistic.find_or_create_by(user: current_user)
  end
end
