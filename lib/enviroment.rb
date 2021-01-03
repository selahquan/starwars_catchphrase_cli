require_relative "./starwars_catchphrase_cli/version"

require 'bundler'
Bundler.require
require_relative "./sw_catchphrase_cli/api.rb"
require_relative "./sw_catchphrase_cli/characters.rb"
require_relative "./sw_catchphrase_cli/cli.rb"
puts "in enviroment"