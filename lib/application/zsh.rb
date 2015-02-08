module Application
  class Zsh < Base
    attr_accessor :base_directory

    def install
      FileUtils.chdir(base_directory) do
        install_plugins
        install_zshrc
        install_zshrc_local
        install_customizations
      end
    end

    private

    def install_zshrc
      source = File.expand_path(File.join(base_directory, '.zshrc'))
      target = File.expand_path(File.join(home_directory, '.zshrc'))
      Link.new(source, target).create
    end

    def install_zshrc_local
      source = File.expand_path(File.join(base_directory, '.zshrc.local'))
      target = File.expand_path(File.join(home_directory, '.zshrc.local'))
      unless File.exist?(target)
        FileUtils.cp(source, target)
      end
    end

    def install_customizations
      FileUtils.chdir('custom') do
        Dir.glob('*.zsh').each do |file|
          source = File.expand_path(file)
          target = File.expand_path(File.join(zsh_custom_dir, file))
          Link.new(source, target).create
        end
      end
    end

    def install_plugins
      FileUtils.chdir(plugins_dir) do
        clone_repo(name: 'opp.zsh', url: 'git@github.com:hchbaw/opp.zsh.git')
        clone_repo(name: 'zsh-syntax-highlighting', url: 'git@github.com:zsh-users/zsh-syntax-highlighting.git')
        clone_repo(name: 'alias-tips', url: 'git@github.com:djui/alias-tips.git')
      end
    end

    def zsh_dir
      @zsh_dir ||= ENV['ZSH']
    end

    def zsh_custom_dir
      @zsh_custom_dir ||= File.join(zsh_dir, 'custom')
    end

    def plugins_dir
      File.join(zsh_custom_dir, 'plugins')
    end
  end
end
