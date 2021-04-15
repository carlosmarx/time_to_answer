class Site::SearchController < Site::SiteController
    
  def questions
    @questions = Question.scope_search(params[:page], params[:term].downcase)  
  end 
    
end
