class AdminStatistic < ApplicationRecord
  EVENTS = {
    total_users: "TOTAL USERS",
    total_questions: "TOTAL QUESTIONS"
  }

  # Scopes
  scope :total_questions, -> {
    find_by_event(EVENTS[:total_questions]).value
  }
  scope :total_users, -> {
    find_by_event(EVENTS[:total_users]).value
  }


  #Class methods
  def self.set_event(event)
    admin_statistic = AdminStatistic.find_or_create_by(event: event)
    admin_statistic.value += 1
    admin_statistic.save
  end
  
end
