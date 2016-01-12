require_relative 'lib/decorator'
require_relative 'lib/entry'
require_relative 'lib/reporter'

def report(entry)
  puts Reporter.call(entry)
end

entries = $stdin.each_line.map { |line| Entry.from_string(line) }

puts 'Output 1:'
entries.sort_by { |e| [e.gender.to_s, e.last_name] }.each { |e| report(e) }
puts

puts 'Output 2:'
entries.sort_by { |e| [e.birth_date, e.last_name] }.each { |e| report(e) }
puts

puts 'Output 3:'
entries.sort { |a, b| b.last_name <=> a.last_name }.each { |e| report(e) }
puts
