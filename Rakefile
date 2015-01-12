task :vim do
  chdir('vim') do
    vimrc_before_target = File.expand_path(File.join(ENV['HOME'], '.vimrc.before'))
    vimrc_before_source = File.expand_path('.vimrc.before')

    if File.exists?(vimrc_before_target)
      print("#{vimrc_before_target} exists. Overwrite? [y/n]")
      exit unless STDIN.gets =~ /y/i
      rm(vimrc_before_target)
    end
    sh("ln -s #{vimrc_before_source} #{vimrc_before_target}")

    vimrc_after_source = File.expand_path('.vimrc.after')
    vimrc_after_target = File.expand_path(File.join(ENV['HOME'], '.vimrc.after'))

    if File.exists?(vimrc_after_target)
      print("#{vimrc_after_target} exists. Overwrite? [y/n]")
      exit unless STDIN.gets =~ /y/i
      rm(vimrc_after_target)
    end
    sh("ln -s #{vimrc_after_source} #{vimrc_after_target}")
  end
end

task :zsh do
  chdir('zsh') do
    # Install .zshrc
    zshrc_source = File.expand_path('.zshrc')
    zshrc_target = File.expand_path(File.join(ENV['HOME'], '.zshrc'))
    if File.exists?(zshrc_target)
      print("#{zshrc_target} exists. Overwrite? [y/n]")
      exit unless STDIN.gets =~ /y/i
      rm(zshrc_target)
    end
    sh("ln -s #{zshrc_source} #{zshrc_target}")

    # Install custom files
    chdir('custom') do
      zsh_custom_dir = File.join(ENV['ZSH'], 'custom')
      zsh_files = Dir.glob('*.zsh')
      zsh_files.each do |file|
        source = File.expand_path(file)
        target = File.join(zsh_custom_dir, file)
        if File.exist?(target)
          print("#{target} exists. Overwrite? [y/n]")
          next unless STDIN.gets =~ /y/i
          rm(target)
        end
        sh("ln -s #{source} #{target}")
      end
    end
  end
end

