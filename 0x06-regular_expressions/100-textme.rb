#!/usr/bin/env ruby
# 0x06-regular_expressions/100-textme.rb
puts ARGV[0].scan(/\[from:(.*?)\]\s\[to:(.*?)\]\s\[flags:(.*?)\]/).join(',')
  