module Application
  class Vim < Base
    def install
      FileUtils.chdir(base_directory) do
        install_pathogen
        install_powerline_fonts
        install_pathogen_plugins
        add_vimrc
      end
    end

    private

    def add_vimrc
      source = File.expand_path(File.join(base_directory, '.vimrc'))
      target = File.expand_path(File.join(home_directory, '.vimrc'))
      Link.new(source, target).create
    end

    def install_pathogen
      chdir_vendor do
        clone_repo(name: 'pathogen.vim', url: 'git@github.com:tpope/vim-pathogen.git') do
          autoload_dir = File.join(home_directory, '.vim/autoload')
          FileUtils.mkdir_p(autoload_dir)

          source = File.expand_path(File.join(Dir.pwd, 'autoload/pathogen.vim'))
          target = File.expand_path(File.join(autoload_dir, 'pathogen.vim'))
          Link.new(source, target).create
        end
      end
    end

    def install_powerline_fonts
      chdir_vendor do
        clone_repo(name: 'powerline-fonts', url: 'git@github.com:powerline/fonts.git') do
          system('./install.sh')
        end
      end
    end

    def install_pathogen_plugins
      install_pathogen_plugin('ag.vim', 'git@github.com:rking/ag.vim.git')
      install_pathogen_plugin('ctrlp.vim', 'git@github.com:kien/ctrlp.vim.git')
      install_pathogen_plugin('endwise.vim', 'git@github.com:tpope/vim-endwise.git')
      install_pathogen_plugin('fugitive.vim', 'git@github.com:tpope/vim-fugitive.git')
      install_pathogen_plugin('gundo.vim', 'git@github.com:sjl/gundo.vim.git')
      install_pathogen_plugin('matchit', 'git@github.com:tmhedberg/matchit.git')
      install_pathogen_plugin('neocomplcache.vim', 'git@github.com:Shougo/neocomplcache.vim.git')
      install_pathogen_plugin('nerdtree', 'git@github.com:scrooloose/nerdtree.git')
      install_pathogen_plugin('vim-rspec', 'git@github.com:thoughtbot/vim-rspec.git')
      install_pathogen_plugin('surround.vim', 'git@github.com:tpope/vim-surround.git')
      install_pathogen_plugin('syntastic', 'git@github.com:scrooloose/syntastic.git')
      install_pathogen_plugin('vim-autoclose', 'git@github.com:Townk/vim-autoclose.git')
      install_pathogen_plugin('vim-gitgutter', 'git@github.com:airblade/vim-gitgutter.git')
      install_pathogen_plugin('vim-multiple-cursors', 'git@github.com:terryma/vim-multiple-cursors.git')
      install_pathogen_plugin('vim-rspec', 'git@github.com:thoughtbot/vim-rspec.git')
      install_pathogen_plugin('vim-textobj-rubyblock', 'git@github.com:nelstrom/vim-textobj-rubyblock.git')
      install_pathogen_plugin('vim-textobj-user', 'git@github.com:kana/vim-textobj-user.git')
      install_pathogen_plugin('vim-tomorrow-theme', 'git@github.com:chriskempson/vim-tomorrow-theme.git')
    end

    def install_pathogen_plugin(name, url)
      bundle_path = File.expand_path(File.join(home_directory, '.vim/bundle'))
      FileUtils.mkdir_p(bundle_path)
      FileUtils.chdir(bundle_path) do
        clone_repo(name: name, url: url)
      end
    end

    def chdir_vendor(&block)
      FileUtils.mkdir_p('vendor')
      FileUtils.chdir('vendor', &block)
    end
  end
end
