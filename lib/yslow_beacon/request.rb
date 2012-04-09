module YSlowBeacon
  class Request
    attr_reader :url, :size, :load_time

    def initialize(attrs = {})
      @url          = attrs.fetch(:url)
      @size         = attrs.fetch(:size)
      @load_time    = attrs.fetch(:load_time)
    end
  end
end
