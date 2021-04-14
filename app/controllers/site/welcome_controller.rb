class Site::WelcomeController < Site::SiteController
  def index
    @questions = Question.includes(:answers).page params[:page]
  end
end
