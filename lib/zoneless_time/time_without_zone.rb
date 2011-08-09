module ZonelessTime
  class TimeWithoutZone
    attr_accessor :date, :hour, :min, :sec, :usec
    
    RFC2822_DAY_NAME = Time::RFC2822_DAY_NAME
    RFC2822_MONTH_NAME = Time::RFC2822_MONTH_NAME

    def xmlschema
      to_time.xmlschema.gsub(/\+.*\Z/, '')
    end

    def <=>(other)
      to_i <=> other.to_i
    end

    def >(other)
      to_i > other.to_i
    end

    def <(other)
      to_i < other.to_i
    end

    def +(amount)
      (to_time + amount).without_zone
    end

    def -(amount)
      result = to_time - amount
      (result.is_a? Time) ? result.without_zone : result
    end

    def initialize(year,month,day,hour,min,sec,usec=0)
      @date = Date.new(year,month,day)
      @hour = hour
      @min = min
      @sec = sec
      @usec = usec
    end

    def year
      date.year
    end
    def month
      date.month
    end
    def day
      date.day
    end
    def wday
      date.wday
    end

    def to_s(type=nil)
      if type == :db
        "#{year}-#{two_char month}-#{two_char day} #{two_char hour}:#{two_char min}:#{two_char sec}"
      else
        "#{RFC2822_DAY_NAME[wday]} #{RFC2822_MONTH_NAME[month-1]} #{day} #{two_char hour}:#{two_char min}:#{two_char sec} #{year}"
      end
    end

    def inspect
      to_s
    end

    def to_i
      to_time.to_i
    end

    def without_zone
      dup
    end

    def in_time_zone(*args)
      dup
    end

    def local
      dup
    end

    def strftime(*args)
      to_time.strftime *args
    end

    def matches?(other)
     [:year, :month, :day, :hour, :min, :sec].all? { |sym| other.send(sym) == self.send(sym) }
    end

    def to_time
      Time.local(year, month, day, hour, min, sec, usec)
    end

    def to_date
      Date.new(year, month, day)
    end

    def ==(other)
      matches? other
    end

    def acts_like?(sym)
      [:date, :time].include? sym
    end

    private
    def two_char(s)
      "00#{s}"[-2..-1]
    end

    class <<self
      def at(time)
        if time.is_a? self
          time
        elsif time.acts_like? :time
          from_time time
        else
          from_time Time.at(time)
        end
      end

      private
      def from_time(time)
        args = [time.year, time.month, time.day, time.hour, time.min, time.sec]
        args << time.usec if time.respond_to? :usec
        new *args
      end
    end
  end
end
