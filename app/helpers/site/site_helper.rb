module Site::SiteHelper
  def msg_home_questions
    case params[:action]
    when 'index'
      "Últimas perguntas cadastradas!"
    when 'questions'
      "Resultados para o termo \"#{params[:term]}\""
    when 'subject'
      "Resultados para o assunto \"#{params[:subject]}\""
    end 
  end
end