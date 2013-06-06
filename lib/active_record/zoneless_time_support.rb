module ActiveRecord
  module ZonelessTimeSupport
    def zoneless_time(sym)
      instance_eval do
        define_method sym do
          t = instance_variable_get(:"@#{sym}")

          if t.nil?
            t = ZonelessTime::TimeWithoutZone.at(read_attribute(sym.to_s))
            instance_variable_set(:"@#{sym}", t)
          end

          t
        end

        self.skip_time_zone_conversion_for_attributes << sym

        define_method "#{sym}=" do |val|
          if val.is_a? ZonelessTime::TimeWithoutZone
            super val
          else
            super ZonelessTime::TimeWithoutZone.at(val)
          end

          instance_variable_set(:"@#{sym}", nil)
          send sym
        end
      end
    end
  end
end
