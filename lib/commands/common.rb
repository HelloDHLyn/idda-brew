require 'json'


def read_template(template_name)
  paths = [
      "./templates/#{template_name}.json",
      "./templates/apps/#{template_name}.json",
      "./templates/projects/#{template_name}.json"
  ]

  paths.each do |path|
    begin
      return JSON.parse(File.read(path))
    rescue
      next
    end
  end

  # FIXME: raise error
  abort 'No such template'
end

def validate(name)
  template = read_template name
  `#{template['validator']}`

  unless $?.exitstatus == 0
    abort 'Failed to validate.'
  end
end