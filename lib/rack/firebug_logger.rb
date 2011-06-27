module Rack
  class FirebugLogger
    def initialize(app, options = {})
      @app     = app
      @options = options
    end

    def call(env)
      status, headers, orig_response = @app.call(env)
      return [status, headers, orig_response] unless (headers["Content-Type"] =~ /html/ && env['firebug.logs'])
      new_response = Rack::Response.new([], status, headers)
      js = generate_js(env['firebug.logs'])
      if orig_response.body =~ /<body>/
        orig_response.each do |line|
          newline = line.gsub("</body>", js + "\n</body>")
          new_response.write(newline)
        end
      else
        new_response.write(orig_response.body + js)
      end
      new_response.finish
    end

    private

    def generate_js(logs)
      js = ["<script type=\"text/javascript\">"]
      start_group(js)
      logs.each do |level, log|
        level = sanitise_level(level)
        log.gsub!('"', '\"')
        js << "console.#{level.to_s}(\"#{log}\");"
      end
      end_group(js)
      js << "</script>"
      js.join("\n")
    end

    def start_group(js)
      if @options[:group]
        js << "console.group(\"#{@options[:group]}\");"
      end
    end

    def sanitise_level(level)
      [:info, :debug, :warn, :error].include?(level) ? level : :debug
    end

    def end_group(js)
      if @options[:group]
        js << "console.groupEnd();"
      end
    end
  end
end

