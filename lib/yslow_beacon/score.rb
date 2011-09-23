module YSlowBeacon
  class Score
    attr_reader :name, :score, :info

    def initialize(attrs = {})
      @name  = attrs.fetch(:name)
      @score = attrs.fetch(:score)
      @info  = attrs.fetch(:info, [])
    end
  end
end
