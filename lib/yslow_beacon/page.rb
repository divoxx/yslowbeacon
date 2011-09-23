module YSlowBeacon
  class Page < Request
    attr_reader :score, :assets, :scores

    def initialize(attrs = {})
      super
      @score  = attrs.fetch(:score)
      @assets = []
      @scores = []
    end

    def grade
      case @score
      when 90..100 then "A"
      when 81..89  then "B"
      when 70..80  then "C"
      when 60..69  then "D"
      when 51..59  then "E"
      when 0..50   then "F"
      end
    end
  end
end
