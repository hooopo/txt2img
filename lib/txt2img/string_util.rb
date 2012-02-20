# encoding: utf-8
require 'unicode/display_width'

module Txt2img
  module StringUtil
    def size(string)
      string.display_width
    end

    def split_by_width(str, width)
      chars = str.chars.to_a

      current_length = 0
      split_index    = 0

      chars.each_with_index do |c, i|
        char_width = self.size(c)
        break if current_length + char_width > width
        split_index = i + 1
        current_length += char_width
      end

      [chars[0, split_index].join, chars[split_index..-1].join]
    end

    def wrap_by_width(str, width)
      lines = []

      while !str.empty? do
        head, tail = split_by_width(str, width)
        lines << head
        str = tail
      end

      lines.join("\n")
    end
  end
end
