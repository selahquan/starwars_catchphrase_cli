require_relative "./starwars_catchphrase_cli/version"

require 'bundler'
Bundler.require
require_relative "./api.rb"
require_relative "./characters.rb"
require_relative "./cli.rb"
puts "in enviroment"