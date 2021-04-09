DEFAULT_PASSWD = 123456
DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

namespace :dev do
  desc "Configura o ambiente de desenvolvimento."
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando banco de dados", "Banco apagado com sucesso!") { %x(rails db:drop) }
      show_spinner("Criando banco de dados", "Banco criado com sucesso!!") { %x(rails db:create) }
      show_spinner("Executando migrations", "Migrations executadas com sucesso!") { %x(rails db:migrate) }
      %x(rails dev:add_default_admin)
      %x(rails dev:add_extra_admins)
      %x(rails dev:add_default_user)
      show_spinner("Cadastrando assuntos padrões", "Cadastrado com sucesso!") { %x(rails dev:add_subjects) }
      show_spinner("Cadastrando perguntas e respostas padrões", "Cadastrado com sucesso!") { %x(rails dev:add_questions_and_answers) }
    else 
      puts "Você não está em ambiente de desenvolvimento"
    end
  end 

  desc "Add administrador padrão"
  task add_default_admin: :environment do
    show_spinner("Cadastrando Admin") do
      Admin.create!(
        email: "admin@mail.com",
        password: DEFAULT_PASSWD,
        password_confirmation: DEFAULT_PASSWD
      )
    end
  end

  desc "Add administradores extras"
  task add_extra_admins: :environment do
    show_spinner("Cadastrando Admins extras") do
      10.times do |i|
        Admin.create!(
          email: Faker::Internet.email,
          password: DEFAULT_PASSWD,
          password_confirmation: DEFAULT_PASSWD
        )
      end
    end
  end

  desc "Add usuário padrão"
  task add_default_user: :environment do
    show_spinner("Cadastrando Usuário") do
      User.create!(
        email: "user@mail.com",
        password: DEFAULT_PASSWD,
        password_confirmation: DEFAULT_PASSWD
      )
    end
  end

  desc "Adciona assuntos padrões"
  task add_subjects: :environment do
    file_name = 'subjects.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Subject.create!(description: line.strip)
    end
  end

  desc "Adciona perguntas e respostas padrões"
  task add_questions_and_answers: :environment do
    Subject.all.each do |subject|
      rand(5..10).times do |i|
        
        params = create_question_params(subject)
        answers_array = params[:question][:answers_attributes]

        add_answers(answers_array)
        elect_true_answer(answers_array)

        Question.create!(params[:question])
      end
    end
  end

  private

  def create_question_params(subject = Subject.all.sample)
    {
      question: {
        description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
        subject: subject,
        answers_attributes: []
      }
    }
  end

  def create_answer_params(correct = false)
    { description:Faker::Lorem.sentence, correct: correct }
  end

  def add_answers(answers_array = [])
    rand(2..5).times do |j|
      answers_array.push(
        create_answer_params
      )
    end
  end

  def elect_true_answer(answers_array = [])
    selected_index = rand(answers_array.size)
    answers_array[selected_index] = create_answer_params(true)
  end
  

  def show_spinner(msg_start = "Executando", msg_end = "Concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}...")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end
