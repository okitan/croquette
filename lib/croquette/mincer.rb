module Croquette
  class Mincer
    def self.parse(&block)
      self.new.parse(&block)
    end

    def parse(&block)
      self.instance_eval(&block)
    end
  end
end
