require 'optparse'
require './scientist'
require './error'

def calculating_scientist_h_index(citations)
  scientist = Scientist.new(citations)

  puts("Since the amount of citations by scientist is (#{scientist.citations.join(', ')}),")
  puts("then the scientist has #{scientist.citations.size} papers")
  if scientist.h_index
    puts("and H-index calculated equals to #{scientist.h_index || 'no'}.")
  else
    puts("and there is not a H-index value")
  end
end

def run_tests
  puts('Running tests...')
  require './test'
end

options = {
  tests: false
}

OptionParser.new do |opts|
  opts.on('-c=s', '--citations=s', 'Sciencist citations') do |citations|
    options[:citations] = citations.split(' ').map(&:to_i)
  end
  opts.on('-t', '--tests', TrueClass, 'Test will run') do |t|
    options[:tests] = t.nil? ? false : t
  end
end.parse!

if options[:tests]
  run_tests
else
  begin
    calculating_scientist_h_index(options[:citations])
  rescue ScientistError => e
    puts("[ERROR] #{e.message}")
  end
end
