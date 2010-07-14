require 'croquette/rack/builder' # add Rack::Builder#croquette

module Croquette
  VERSION = File.read(File.join(File.dirname(__FILE__), %w[ .. VERSION])).chomp

  autoload :Mincer, 'croquette/mincer'
end
