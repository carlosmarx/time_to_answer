class Site::AnswerController < Site::SiteController 
  def question
    @answer = Answer.find(params[:answer_id])
  end
  
end
