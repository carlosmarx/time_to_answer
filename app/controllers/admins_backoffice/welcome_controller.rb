class AdminsBackoffice::WelcomeController < AdminsBackoffice::AdminController
  def index
    @total_users = AdminStatistic.find_by_event(AdminStatistic::EVENTS[:total_users]).value
    @total_questions = AdminStatistic.find_by_event(AdminStatistic::EVENTS[:total_questions]).value
  end
end
