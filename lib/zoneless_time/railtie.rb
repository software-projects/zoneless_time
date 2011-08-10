require 'zoneless_time'
require 'rails'

module ZonelessTime
  class Railtie < Rails::Railtie
    initializer 'zoneless_time.configure_rails_initialization' do
      ActiveSupport::TimeWithZone.send :include, ZonelessTime::TimeExtension::InstanceMethods
      ActiveRecord::Base.send :extend, ActiveRecord::ZonelessTimeSupport

      if config.time_zone_aware_attributes
        require 'zoneless_time/warning'
      end
    end
  end
end
