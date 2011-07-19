module ActiveRecord
  module ZonelessTimeSupport
    def zoneless_time(sym)
      instance_eval do
        self.composed_of sym, :class_name => 'ZonelessTime::TimeWithoutZone',
          :mapping => [[sym, 'time']], :constructor => :at
        self.skip_time_zone_conversion_for_attributes << sym
        define_method "#{sym}=" do |val|
          if val.is_a? ZonelessTime::TimeWithoutZone
            super val
          else
            super ZonelessTime::TimeWithoutZone.at(val)
          end
        end
      end

      if time_zone_aware_attributes
        require 'zoneless_time/warning'
      end
    end
  end
end
