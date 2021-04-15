class Question < ApplicationRecord
  belongs_to :subject, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  #Kaminari
  paginates_per 5

  scope :scope_search, ->(page, term){
    includes(:subject, :answers)
            .where("lower(description) LIKE ?", "%#{term}%")
            .page page
  }

  scope :last_questions, ->(page){
    includes(:answers).order('created_at desc').page page
  }
  
end
