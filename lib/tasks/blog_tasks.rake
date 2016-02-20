# desc "Explaining what the task does"
# task :blog do
#   # Task goes here
# end

task :test do
  Rake::Task['db:test:prepare'].invoke
  Dir[Rails.root.join('test/**/*_test.rb')].each { |f| require f }
end

namespace :all do
  task :tests do
    Rake::Task['test'].invoke
  end
end
