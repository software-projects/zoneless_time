require 'zoneless_time'
require 'rails'

module ZonelessTime
  class Railtie < Rails::Railtie
    initializer 'zoneless_time.configure_rails_initialization' do
      ActiveSupport::TimeWithZone.send :include, EqualityWithZonelessTime
      ActiveRecord::Base.send :extend, ActiveRecord::ZonelessTimeSupport
    end
  end
end
