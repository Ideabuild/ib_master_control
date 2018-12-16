# frozen_string_literal: true
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => [:style, :tests]

task :style => ['style:server']
task :tests => ['spec:server']

namespace :spec do
  task :server => [:spec]
end

namespace :style do
  task :server do
    sh 'rubocop'
  end
end
