class Site::WelcomeController < Site::SiteController
  def index
    @questions = Question.last_questions(params[:page])
  end
end
