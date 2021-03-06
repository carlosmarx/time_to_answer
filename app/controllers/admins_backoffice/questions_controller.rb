class AdminsBackoffice::QuestionsController < AdminsBackoffice::AdminController
    before_action :set_question, only: [:edit, :update, :destroy]
    before_action :get_subject_options, only: [:new, :edit]
    
  def index
    # @questions = Question.all.page(params[:page]).per(5)
    @questions = Question.includes(:subject)
                         .order(:description)
                         .page params[:page]
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(params_question)
    if @question.save
      redirect_to admins_backoffice_questions_path, notice: "Pergunta cadastrada com sucesso."
    else
      render :new
    end
  end
  
  
  def update
    if @question.update(params_question)
      redirect_to admins_backoffice_questions_path, notice: "Pergunta atualizada com sucesso."
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      redirect_to admins_backoffice_questions_path, notice: "Pergunta excluída com sucesso."
    else
      render :index
    end
  end
  
  
  private
    def params_question
      params_question = params.require(:question).permit(:description, :subject_id, 
        answers_attributes: [:id, :description, :correct, :_destroy])
    end
    
    def set_question
        @question = Question.find(params[:id])
    end

    def get_subject_options 
        @subjects = Subject.all
    end
    
end
