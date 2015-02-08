module Application
  class Vim < Base
    def install
      FileUtils.chdir(base_directory) do
        install_pathogen
        install_colorscheme
        add_vimrc_before
        add_vimrc_plugins
        add_vimrc_after
        add_vimrc
      end
    end

    private

    def add_vimrc_before
      source = File.expand_path(File.join(base_directory, '.vimrc.before'))
      target = File.expand_path(File.join(home_directory, '.vimrc.before'))
      Link.new(source, target).create
    end

    def add_vimrc_after
      source = File.expand_path(File.join(base_directory, '.vimrc.after'))
      target = File.expand_path(File.join(home_directory, '.vimrc.after'))
      Link.new(source, target).create
    end

    def add_vimrc_plugins
      source = File.expand_path(File.join(base_directory, '.vimrc.plugins'))
      target = File.expand_path(File.join(home_directory, '.vimrc.plugins'))
      Link.new(source, target).create
    end

    def add_vimrc
      source = File.expand_path(File.join(base_directory, '.vimrc'))
      target = File.expand_path(File.join(home_directory, '.vimrc'))
      Link.new(source, target).create
    end

    def install_pathogen
      FileUtils.chdir('vendor') do
        clone_repo(name: 'pathogen.vim', url: 'git@github.com:tpope/vim-pathogen.git') do
          autoload_dir = File.join(home_directory, '.vim/autoload')
          FileUtils.mkdir_p(autoload_dir)

          source = File.expand_path(File.join(Dir.pwd, 'autoload/pathogen.vim'))
          target = File.expand_path(File.join(autoload_dir, 'pathogen.vim'))
          Link.new(source, target).create
        end
      end
    end

    def install_colorscheme
      FileUtils.chdir('vendor') do
        clone_repo(name: 'badwolf', url: 'git@github.com:sjl/badwolf.git') do |name, _|
          color_files = Dir.glob(File.expand_path('colors/*.vim'))
          color_files.each do |color_file|
            base_name = File.basename(color_file)
            target = File.expand_path(File.join(home_directory, ".vim/colors/#{base_name}"))
            Link.new(color_file, target).create
          end
        end
      end
    end
  end
end
