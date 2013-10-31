require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = "test/acceptance/*_test.rb"
end

Rake::TestTask.new do |t|
  t.pattern = "test/clone_warz/*_test.rb"
end

Rake::TestTask.new do |t|
  t.pattern = "test/*_test.rb"
end

task default: :test
