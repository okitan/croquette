require 'croquette/rack/builder' # add Rack::Builder#croquette
require 'croquette/mincer'
require 'croquette/exceptions'

module Croquette
  VERSION = File.read(File.join(File.dirname(__FILE__), %w[ .. VERSION])).chomp
end
