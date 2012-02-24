# encoding: utf-8

require "txt2img/version"
require "txt2img/string_util"

module Txt2img
  class Txt
    include StringUtil

    attr_accessor :txt, :font, :width, :pointsize, :border, :kerning, :wrap

    def initialize(txt, options = {})
      @txt = txt
      @font = options[:font] || File.expand_path("../../fonts/microhei.ttc", __FILE__)
      @width = options[:width] || 20
      @pointsize = options[:pointsize] || 30
      @border = options[:border] || "20x20"
      @kerning = options[:kerning] || 1
      @wrap = options[:wrap] || false
    end

    # TODO escape txt
    def write(path)
      if wrap
      wrap!
      `convert -pointsize #{pointsize} -size #{max_canvas_width}x -kerning #{kerning} -border #{border} -bordercolor white -font #{font}  caption:'#{txt}' #{path}`
      else
        `convert -pointsize #{pointsize} -border #{border} -bordercolor white -font #{font} label:'#{txt}'   #{path}`
      end
    end

    # TODO optimize
    # TODO NOT break English word
    def wrap!
      @txt = @txt.split(/[\r\n]+/).map do |line|
        wrap_by_width(line, width)
      end * "\n"
    end

    def max_canvas_width
      (pointsize  * (width / 2.0) + kerning * (width / 2.0 - 1)).ceil
    end

    def height
      @txt.split(/[\r\n]+/).size
    end
  end
end
