class Quotes < Padrino::Application
  register LessInitializer
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers

  enable :sessions
end
