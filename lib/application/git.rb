module Application
  class Git < Base
    def install
      chdir(base_directory) do
        add_gitconfig
        add_gitignore
      end
    end

    private

    def add_gitconfig
      source = File.expand_path(File.join(base_directory, '.gitconfig'))
      target = File.expand_path(File.join(home_directory, '.gitconfig'))
      Link.new(source, target).create
    end

    def add_gitignore
      source = File.expand_path(File.join(base_directory, '.gitignore'))
      target = File.expand_path(File.join(home_directory, '.gitignore'))
      Link.new(source, target).create
    end
  end
end
