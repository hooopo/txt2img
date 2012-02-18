require "txt2img/version"
require 'quick_magick'

module Txt2img
  class Txt

    attr_accessor :txt, :font, :width, :pointsize

    def initialize(txt, font = nil, width = 20, pointsize = 40)
      @txt = txt
      @font ||= File.expand_path("../../fonts/microhei.ttc", __FILE__)
      @width ||= 20
      @pointsize ||= 40
    end

    def write(path)
      wrap!
      image = QuickMagick::Image::solid(width * pointsize + 100, ((height * pointsize) * 1.3).to_i, :white)
      image.font = font
      image.pointsize = 40
      image.draw_text(0, 0, txt, :gravity => "center")
      image.save(path)
    end

    # TODO optimize
    def wrap!
      @txt = @txt.split(/[\r\n]+/).map{|x| x.scan(/.{1,#{width}}/).join("\n")}.join("\n")
    end

    def height
      @txt.split(/[\r\n]+/).size
    end
  end
end
