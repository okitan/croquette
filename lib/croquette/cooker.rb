module Croquette
  class Masher
    class << self
      def mash(&block)
        Class.new(Masher) do |klass|
          klass.instance_eval(&block)
        end.new
      end

      def method_missing(name, *args, &block)
        command, opts = *args
        opts ||= {}
        
        module_eval <<-DEF, __FILE__, __LINE__ + 1
          def #{name.to_s}
            %x(#{command}).tap do
              raise(Redirect, "#{opts[:redirect_to]}") if #{opts[:redirect_to] != nil}
            end.chomp
          end
        DEF
      end
    end
  end
  
  class Mincer
    def self.mince(&block)
      self.new.mince(&block)
    end

    def mince(&block)
      (@mince ||= {}).tap { self.instance_eval(&block) }
    end

    def method_missing(name, *args, &block)
      @mince[name] = Masher.new(&block) if block_given?
    end
  end

end
