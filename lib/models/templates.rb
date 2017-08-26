class Templates
  def initialize(name)
    read_configs name
  end

  def valid?(params = {})
    #
    # return true if the app is installed
    #

    cmd = make_command! @configs['validator'], params
    run_command cmd
  end

  def get_invalid_dependencies
    #
    # Get array of invalid dependencies
    #
    # Returns =>
    #   - array of invalid dependencies
    #

    @configs['dependencies'].select do |name|
      begin
        dep_template = Templates.new name
      rescue
        true
      else
        !dep_template.valid?
      end
    end
  end

  def make(params)
    #
    # Make new project (app).
    #
    # Returns =>
    #   Validated result after make
    #

    unless self.valid? params
      @configs['make']
          .collect {|cmd| make_command! cmd, params}
          .each {|cmd| run_command cmd, true}
    end
  end

  private
  def read_configs(name)
    require 'json'

    paths = [
        "../templates/#{name}.json",
        "../templates/apps/#{name}.json",
        "../templates/projects/#{name}.json"
    ]

    paths.collect {|p| File.join(File.dirname(__FILE__), p)}.each do |p|
      begin
        @configs = JSON.parse File.read(p)
        return
      rescue
        next
      end
    end

    raise "Undefined template: #{name}"
  end

  private
  def make_command!(src, params)
    params.each do |k, v|
      src.gsub! "{{#{k.upcase}}}", v
    end

    src
  end

  private
  def run_command(cmd, print = false)
    if print
      puts "> #{cmd}"
      system cmd
    else
      system cmd, :out => File::NULL
    end
  end
end