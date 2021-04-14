class Site::SearchController < Site::SiteController
    
  def questions
    @questions = Question.includes(:subject, :answers)
                         .order(:description)
                         .page params[:page]  
  end 
    
end
