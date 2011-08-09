module ZonelessTime
end

require 'active_record/zoneless_time_support'
require 'zoneless_time/time_without_zone'
require 'zoneless_time/time_extension'

Time.send :include, ZonelessTime::TimeExtension::InstanceMethods

require 'zoneless_time/railtie' if defined? Rails
