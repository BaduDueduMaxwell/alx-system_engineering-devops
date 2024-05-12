#!/usr/bin/env ruby
# 0x06-regular_expressions/6-phone_number
puts ARGV[0].scan(/^[0-9]{10}$/).join