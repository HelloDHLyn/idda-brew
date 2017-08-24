#
# Manage projects
#   - idw project start {{TEMPLATE}} {{PROJECT}}
#

require 'commands/common'


def project(args)
  def start(args)
    template_name = args[1] or abort 'Template name required.'
    prj_name = args[2] or abort 'Project name required.'

    template = read_template template_name

    # Check dependencies
    template['dependencies'].each do |dep|
      puts "Validating dependency: #{dep}"
      validate dep
    end
    puts "All dependencies are ready.\n"

    # Run make commands
    template['make'].each do |command|
      command = command.gsub '{{PROJECT_NAME}}', prj_name
      puts "\n> #{command}"
      system command
    end

    puts "\nProject had successfully set!"
  end

  case args[0]
    when 'start'
      start args

    else
      abort "No such subcommand: #{args[0]}"
  end
end