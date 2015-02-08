class Link
  attr_accessor :source, :target

  def initialize(source, target)
    @source = source
    @target = target
  end

  def create
    if !File.exist?(target)
      ln(source, target)
      puts " * Link created: #{target} -> #{source}\n"
    elsif !link_established?
      puts "#{target} exists. Replace? [y/n]: "
      return unless STDIN.gets =~ /y/i
      FileUtils.rm(target) and create
    end
  end

  private

  def link_established?
    File.symlink?(target) &&
      File.readlink(target) == source
  end

  def rm(file)
    %x|rm #{file}|
  end

  def ln(source, target)
    %x|ln -s #{source} #{target}|
  end
end

