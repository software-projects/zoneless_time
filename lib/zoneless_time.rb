module ZonelessTime
end

require 'zoneless_time/time_without_zone'
require 'zoneless_time/equality_with_zoneless_time'

Time.send :include, ZonelessTime::EqualityWithZonelessTime

require 'zoneless_time/railtie' if defined? Rails
