require "cgi"

module YSlowBeacon
  class Receiver
    def call(env)
      req = Rack::Request.new(env)
      res = Rack::Response.new([], 201)

      @page = Page.new(
        :size         => req.params['w'],
        :score        => req.params['o'],
        :num_requests => req.params['r'],
        :load_time    => req.params['lt'],
        :url          => CGI.unescape(req.params['u'])
      )

      Array(req.params['comps']).each do |comp|
        @page.assets << Asset.new(
          :asset_type  => comp['type'],
          :url         => CGI.unescape(comp['url']),
          :size        => comp['size'],
          :load_time   => comp['resp'],
          :gziped_size => comp['gzip']
        )
      end

      Array(req.params['g']).each do |name, score|
        @page.scores << Score.new(:name => name, :score => score['score'], :info => score['components'])
      end

      File.open("tmp/output.html", "w") do |f| 
        tpl = File.dirname(__FILE__) + "/report.html.erb"
        erb = Erubis::Eruby.new(File.read(tpl))
        f.write(erb.result(binding))
      end

      res.finish
    end
  end
end
