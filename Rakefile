require './lib/link'

task :vim do
  chdir('vim') do
    vimrc_before_target = File.expand_path(File.join(ENV['HOME'], '.vimrc.before'))
    vimrc_before_source = File.expand_path('.vimrc.before')
    vimrc_after_source = File.expand_path('.vimrc.after')
    vimrc_after_target = File.expand_path(File.join(ENV['HOME'], '.vimrc.after'))

    Link.new(vimrc_before_source, vimrc_before_target).create
    Link.new(vimrc_after_source, vimrc_after_target).create
  end
end

module Zsh
  extend self
  extend Rake::DSL

  def install_zshrc
    source = File.expand_path('.zshrc')
    target = File.expand_path(File.join(ENV['HOME'], '.zshrc'))
    Link.new(source, target).create
  end

  def install_zshrc_local
    source = File.expand_path('.zshrc.local')
    target = File.expand_path(File.join(ENV['HOME'], '.zshrc.local'))
    unless File.exist?(target)
      cp(source, target)
    end
  end

  def install_customizations
    chdir('custom') do
      Dir.glob('*.zsh').each do |file|
        source = File.expand_path(file)
        target = File.expand_path(File.join(zsh_custom_dir, file))
        Link.new(source, target).create
      end
    end
  end

  private

  def zsh_custom_dir
    @zsh_custom_dir ||= File.join(ENV['ZSH'], 'custom')
  end
end

task :zsh do
  chdir('zsh') do
    Zsh.install_zshrc
    Zsh.install_zshrc_local
    Zsh.install_customizations
  end
end

