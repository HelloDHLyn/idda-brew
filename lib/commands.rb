require 'models/templates'


def describe_command(app_name, options={})
  template = Template.new app_name

  [
      "name        : #{template.get_name}",
      "description : #{template.get_description}",
  ].each {|msg| puts msg}
end