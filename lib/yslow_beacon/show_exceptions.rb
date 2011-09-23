module YSlowBeacon
  class ShowExceptions
    def initialize(app)
      @app = app
    end

    def call(env)
      begin
        @app.call(env)
      rescue => e
        puts e.message
        puts e.backtrace
        Rack::Response.new(e.message, 500).finish
      end
    end
  end
end
