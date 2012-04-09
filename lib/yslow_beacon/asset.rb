module YSlowBeacon
  class Asset < Request
    attr_reader :gziped_size

    def initialize(attrs = {})
      super
      @gziped_size  = attrs.fetch(:gziped_size)
    end
  end
end
