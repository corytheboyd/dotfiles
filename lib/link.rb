class Link
  include Rake::DSL

  attr_accessor :source, :target

  def initialize(source, target)
    @source = source
    @target = target
  end

  def create
    if !File.exist?(target)
      ln(source, target)
      print("Link created: #{target} -> #{source}\n")
    elsif !link_established?
      print("#{target} exists. Replace? [y/n]: ")
      return unless STDIN.gets =~ /y/i
      rm(target) and create
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

