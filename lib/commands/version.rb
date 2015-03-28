class BuildarCLI < Thor
  desc 'version', 'show buildar version'
  def version
    puts "buildar #{Buildar::VERSION}"
  end
end
