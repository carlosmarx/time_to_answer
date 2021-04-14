class Site::SearchController < Site::SiteController
    
  def questions
    @questions = Question.search(params[:page], params[:term].downcase)  
  end 
    
end
