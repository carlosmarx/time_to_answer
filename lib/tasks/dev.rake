DEFAULT_PASSWD = 123456

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

  private

  def show_spinner(msg_start = "Executando", msg_end = "Concluído")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}...")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end
