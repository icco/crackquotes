require 'padrino-core/cli/rake'

require File.expand_path('../config/boot.rb', __FILE__)

PadrinoTasks.use(:database)
PadrinoTasks.use(:activerecord)
PadrinoTasks.init

desc "Run a local server."
task :local do
  Kernel.exec("shotgun -s thin -p 9393")
end
