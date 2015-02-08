require './lib/application'

task :vim do
  puts "Installing ViM..."
  base_directory = File.expand_path('vim')
  Application::Vim.new(base_directory).install
end

task :zsh do
  puts "Installing ZSH..."
  base_directory = File.expand_path('zsh')
  Application::Zsh.new(base_directory).install
end

task :git do
  puts "Installing git..."
  base_directory = File.expand_path('git')
  Application::Git.new(base_directory).install
end

task :source do
  `/bin/zsh -c 'source ~/.zshrc'`
end

desc "Update local dotfiles"
task :update do
  dotfiles_directory = File.expand_path('~/dotfiles')
  FileUtils.chdir(dotfiles_directory)
  system('git fetch && git reset --hard origin/master')
  Rake::Task['install'].invoke
end

task :install => [:vim, :zsh, :git, :source]
task :default => :install
