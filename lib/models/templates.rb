class Template
  def initialize(name)
    require 'json'

    path = "../templates/#{name}/idw.json"
    begin
      f = File.join(File.dirname(__FILE__), path)
      @configs = JSON.parse(File.read(f))
    rescue
      abort "Undefined template: #{name}"
    end
  end

  def get_name
    @configs.fetch 'name'
  end

  def get_description
    @configs.fetch 'description', ''
  end

  def get_dependencies
    @configs.fetch 'dependencies'
  end

  def get_validator_command
    @configs.fetch 'validator'
  end

  def get_make_commands
    @configs.fetch 'make'
  end

  ##
  # return true if the app is already make
  #
  def made?(params = {})
    run_command get_validator_command, params
  end

  ##
  # Make new project (app).
  #
  # Returns =>
  #   Validated result after make
  #
  def make(params)
    unless self.made? params
      get_make_commands.each {|cmd| run_command cmd, params, true}
    end
  end

  private
  def run_command(cmd, params, print = false)
    src = cmd
    params.each do |k, v|
      src.gsub! "{{#{k.upcase}}}", v
    end

    if print
      puts "> #{cmd}"
      system cmd
    else
      system cmd, :out => File::NULL
    end
  end
end