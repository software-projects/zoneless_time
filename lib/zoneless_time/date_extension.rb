module ZonelessTime
  module DateExtension
    module InstanceMethods
      # Dates don't have a timezone, so just accept the call blindly
      def without_zone
        self
      end
    end
  end
end
