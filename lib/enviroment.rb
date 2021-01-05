require_relative "./sw_catchphrase_cli/version"

require 'bundler'
Bundler.require
require_relative "./sw_catchphrase_cli/api.rb"
require_relative "./sw_catchphrase_cli/character.rb"
require_relative "./sw_catchphrase_cli/cli.rb"

puts "in enviroment"