module YSlowBeacon
  class Request
    attr_reader :url, :friendly_url, :size, :load_time

    def initialize(attrs = {})
      @url          = attrs.fetch(:url)
      @friendly_url = attrs.fetch(:friendly_url)
      @size         = attrs.fetch(:size)
      @load_time    = attrs.fetch(:load_time)
    end
  end
end
