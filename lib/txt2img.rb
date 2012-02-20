# encoding: utf-8

require "txt2img/version"
require "txt2img/string_util"
require 'quick_magick'

module Txt2img
  class Txt
    include StringUtil

    attr_accessor :txt, :font, :width, :pointsize

    def initialize(txt, options = {})
      @txt = txt
      @font = options[:font] || File.expand_path("../../fonts/microhei.ttc", __FILE__)
      @width = options[:width] || 20
      @pointsize = options[:pointsize] || 30
    end

    def write(path)
      wrap!
      image = QuickMagick::Image::solid(width * pointsize + 100, ((height * pointsize) * 1.3).to_i, :white)
      image.font = font
      image.pointsize = pointsize 
      image.draw_text(0, 0, txt, :gravity => "center")
      image.save(path)
    end

    # TODO optimize
    # TODO NOT break English word
    # TODO tune the margin and text size
    def wrap!
      @txt = @txt.split(/[\r\n]+/).map do |line|
        wrap_by_width(line, width)
      end * "\n"
    end

    def height
      @txt.split(/[\r\n]+/).size
    end
  end
end
