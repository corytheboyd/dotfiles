class Link
  include Rake::DSL

  attr_accessor :source, :target

  def initialize(source, target)
    @source = source
    @target = target
  end

  def create
    if File.exist?(target)
      print("#{target} exists. Overwrite? [y/n]")
      return unless STDIN.gets =~ /y/i
      rm(target) and create
    else
      ln(source, target)
      print("Link created: #{target}\n")
    end
  end

  private

  def rm(file)
    %x|rm #{file}|
  end

  def ln(source, target)
    %x|ln -s #{source} #{target}|
  end
end

