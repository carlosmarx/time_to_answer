class AdminsBackoffice::WelcomeController < AdminsBackoffice::AdminController
  def index
    @total_users = AdminStatistic.total_users
    @total_questions = AdminStatistic.total_questions
  end
end
