module ZonelessTime
  module EqualityWithZonelessTime
    def ==(other)
      if other.is_a? self.class
        ZonelessTime::TimeWithoutZone.at(self).matches? other
      else
        super(other)
      end
    end
  end
end
