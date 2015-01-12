require './lib/application'

task :vim do
  base_directory = File.expand_path('vim')
  Application::Vim.new(base_directory).install
end

task :zsh do
  base_directory = File.expand_path('zsh')
  Application::Zsh.new(base_directory).install
end

task :install => [:vim, :zsh]
task :default => :install
