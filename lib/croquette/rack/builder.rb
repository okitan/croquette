begin
  require 'rack'
rescue LoadError
  require 'rubygems'
  require 'rack'
end

module Rack
  class Builder
    def fry(&block)
      raise 'croquette should be called with block' unless block_given?

      Croquette::Mincer.mince(&block).each do |name, app|
        map name do
          run app
        end
      end
    end
  end
end
