module Application
  class Zsh < Base
    attr_accessor :base_directory

    def install
      chdir(base_directory) do
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

    def zsh_dir
      @zsh_dir ||= ENV['ZSH']
    end

    def zsh_custom_dir
      @zsh_custom_dir ||= File.join(zsh_dir, 'custom')
    end
  end
end
