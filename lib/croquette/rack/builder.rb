begin
  require 'rack'
rescue LoadError
  require 'rubygems'
  require 'rack'
end

module Rack
  class Builder
    def croquette(&block)
      raise 'croquette should be called with block' unless block_given?

      Croquette::Mincer.parse(&block)
    end
  end
end
