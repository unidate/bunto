require "bunto/liquid_renderer/file"
require "bunto/liquid_renderer/table"

module Bunto
  class LiquidRenderer
    def initialize(site)
      @site = site
      Liquid::Template.error_mode = @site.config["liquid"]["error_mode"].to_sym
      reset
    end

    def reset
      @stats = {}
    end

    def file(filename)
      filename = @site.in_source_dir(filename).sub(
        %r!\A#{Regexp.escape(@site.source)}/!,
        ""
      )

      LiquidRenderer::File.new(self, filename).tap do
        @stats[filename] ||= {}
        @stats[filename][:count] ||= 0
        @stats[filename][:count] += 1
      end
    end

    def increment_bytes(filename, bytes)
      @stats[filename][:bytes] ||= 0
      @stats[filename][:bytes] += bytes
    end

    def increment_time(filename, time)
      @stats[filename][:time] ||= 0.0
      @stats[filename][:time] += time
    end

    def stats_table(n = 50)
      LiquidRenderer::Table.new(@stats).to_s(n)
    end

    def self.format_error(e, path)
      if e.is_a? Tags::IncludeTagError
        return "#{e.message} in #{e.path}, included in #{path}"
      end
      "#{e.message} in #{path}"
    end
  end
end
