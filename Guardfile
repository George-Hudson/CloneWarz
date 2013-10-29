# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :minitest do
  # with Minitest::Unit
  watch(%r{^test/(.*)\/?(.*)_test\.rb})
  watch(%r{^lib/(.*/)?([^/]+)\.rb})     { |m| "test/#{m[1]}#{m[2]}_test.rb" }
  watch(%r{^test/test_helper\.rb})      { 'test' }

  # with Minitest::Spec
  # watch(%r{^spec/(.*)_spec\.rb})
  # watch(%r{^lib/(.+)\.rb})         { |m| "spec/#{m[1]}_spec.rb" }
  # watch(%r{^spec/spec_helper\.rb}) { 'spec' }

  # Rails 4
  # watch(%r{^app/(.+)\.rb})                               { |m| "test/#{m[1]}_test.rb" }
  # watch(%r{^app/controllers/application_controller\.rb}) { 'test/controllers' }
  # watch(%r{^app/controllers/(.+)_controller\.rb})        { |m| "test/integration/#{m[1]}_test.rb" }
  # watch(%r{^app/views/(.+)_mailer/.+})                   { |m| "test/mailers/#{m[1]}_mailer_test.rb" }
  # watch(%r{^lib/(.+)\.rb})                               { |m| "test/lib/#{m[1]}_test.rb" }
  # watch(%r{^test/.+_test\.rb})
  # watch(%r{^test/test_helper\.rb}) { 'test' }

  # Rails < 4
  # watch(%r{^app/controllers/(.*)\.rb}) { |m| "test/functional/#{m[1]}_test.rb" }
  # watch(%r{^app/helpers/(.*)\.rb})     { |m| "test/helpers/#{m[1]}_test.rb" }
  # watch(%r{^app/models/(.*)\.rb})      { |m| "test/unit/#{m[1]}_test.rb" }
end

# Add files and commands to this file, like the example:
#   watch(%r{file/path}) { `command(s)` }
#
guard 'shell' do
  watch(/(.*).txt/) {|m| `tail #{m[0]}` }
end