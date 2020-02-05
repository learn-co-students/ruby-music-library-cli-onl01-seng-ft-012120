require 'bundler'
Bundler.require

module Concerns
end
require_relative '../lib/concerns/my_module.rb'
require_all 'lib'
