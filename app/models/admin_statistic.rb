class AdminStatistic < ApplicationRecord
  EVENTS = {
    total_users: "TOTAL USERS",
    total_questions: "TOTAL QUESTIONS"
  }

  def self.set_event(event)
    admin_statistic = AdminStatistic.find_or_create_by(event: event)
    admin_statistic.value += 1
    admin_statistic.save
  end
  
end
