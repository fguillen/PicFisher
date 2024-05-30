# From: https://stackoverflow.com/a/50910685/316700

BARS_COUNT = 3
SYMBOLS = %w|= ** iii|
BARS = ['', '', '']

BARS_COUNT.times { puts } # prepare the space

20.times do |i|
  print "\033[#{BARS_COUNT}A"
  BARS_COUNT.times do |pos|
    BARS[pos] << SYMBOLS[pos]
    puts "\033[#{i * SYMBOLS[pos].length}C#{SYMBOLS[pos]}"
  end
  sleep 0.1
end
