#
# Manage projects
#   - idw project make {{TEMPLATE_NAME}} {{PROJECT_NAME}}
#

require 'models/templates'


def project(args)
  def make(args)
    params = {
        'template_name' => args[1],
        'project_name' => args[2]
    }

    template = Templates.new params['template_name']
    template.get_invalid_dependencies.each do |dep|
      # TODO: install dependencies
      puts dep
    end

    template.make params

    puts "Successfully set '#{params['template_name']}' project!"
  end

  case args[0]
    when 'make'
      make args

    else
      abort "No such subcommand: #{args[0]}"
  end
end