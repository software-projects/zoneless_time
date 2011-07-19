module ZonelessTime
end

Time.send :include, ZonelessTime::EqualityWithZonelessTime

require 'zoneless_time/railtie' if defined? Rails
