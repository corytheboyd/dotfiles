require './lib/application'

task :vim do
  base_directory = File.expand_path('vim')
  Application::Vim.new(base_directory).install
end

task :zsh do
  base_directory = File.expand_path('zsh')
  Application::Zsh.new(base_directory).install
end

task :git do
  base_directory = File.expand_path('git')
  Application::Git.new(base_directory).install
end

desc "Update local dotfiles"
task :update do
  dotfiles_directory = File.expand_path('~/dotfiles')
  chdir(dotfiles_directory)
  sh("git fetch && git reset --hard origin/master")
  Rake::Task['install'].invoke
end

task :install => [:vim, :zsh, :git]
task :default => :install
