module ZonelessTime
  module TimeExtension
    module InstanceMethods
      def ==(other)
        if other.is_a? self.class
          self.without_zone.matches? other
        else
          super(other)
        end
      end

      def without_zone
        ZonelessTime::TimeWithoutZone.at(self)
      end
    end
  end
end
