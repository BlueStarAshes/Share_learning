require 'rake/testtask'

namespace :tests do
	desc 'run all tests'
	task all: [:spec_udacity, :spec_coursera]

	task :spec_udacity do
		sh 'ruby spec/udacity_api_spec.rb'
		puts "\n\n"
	end

	task :spec_coursera do
		sh 'ruby spec/coursera_api_spec.rb'
		puts "\n\n"
	end
end

desc 'delete cassette fixtures'
task :wipe do
  sh 'rm spec/fixtures/cassettes/*.yml' do |ok, _|
    puts(ok ? 'Cassettes deleted' : 'No casseettes found')
  end
end

namespace :quality do
	desc 'run all quality checks'
	task all: [:rubocop, :flog, :flay]

	task :rubocop do
		sh 'rubocop lib/udacity_course.rb lib/coursera_*'
		puts "\n\n"
	end

	task :flog do
		sh 'flog lib/udacity_course.rb lib/coursera_*'
		puts "\n\n"
	end

	task :flay do
		sh 'flay lib/udacity_course.rb lib/coursera_*'
		puts "\n\n"
	end
end