require 'progress_bar'

bar = ProgressBar.new
bar2 = ProgressBar.new

100.times do
  sleep 0.1
  bar.increment!
  bar2.increment!
end
