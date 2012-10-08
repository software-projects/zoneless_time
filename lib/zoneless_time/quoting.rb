module ZonelessTime
  module Quoting
    def quote(value, column=nil)
      return "'#{value.to_s :db}'" if value.is_a? ZonelessTime::TimeWithoutZone
      super(value, column)
    end
  end
end
