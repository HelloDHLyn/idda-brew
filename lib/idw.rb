require 'commands/project'

def run
  case ARGV[0]
    when 'project'
      project ARGV[1..-1]

    else
      abort "No such command: #{ARGV[0]}"
  end
end