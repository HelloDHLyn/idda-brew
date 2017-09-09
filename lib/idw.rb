require 'thor'
require 'commands'

class IdwApp < Thor
  package_name 'Idw'

  desc 'describe TEMPLATE_NAME', 'Describe boilerplate'
  def describe(name)
    describe_command name
  end
end

IdwApp.start