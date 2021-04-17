class Site::SearchController < Site::SiteController
    
  def questions
    @questions = Question.scope_search(params[:page], params[:term].downcase)  
  end

  def subject
    @questions = Question.scope_search_subject(params[:page], params[:subject_id])
  end
  
    
end
