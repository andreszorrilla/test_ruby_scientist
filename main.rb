require 'optparse'
require './scientist'
require './error'

def calculating_scientist_h_index(citations, h_index)
  scientist = Scientist.new(citations)

  puts("Since the amount of citations by scientist is (#{scientist.citations.join(', ')}),")
  puts("then the scientist has #{scientist.citations.size} papers")
  puts("and #{scientist.h_index(h_index) || 'no'} papers with citations above the #{h_index} threshold.")
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
  opts.on('-H=s', '--h-citations=s', 'H citations per scientist') do |h|
    options[:h] = h.to_i
  end
  opts.on('-t', '--tests', TrueClass, 'Test will run') do |t|
    options[:tests] = t.nil? ? false : t
  end
end.parse!

if options[:tests]
  run_tests
else
  begin
    calculating_scientist_h_index(options[:citations], options[:h])
  rescue ScientistError => e
    puts("[ERROR] #{e.message}")
  end
end
