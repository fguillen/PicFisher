require 'ruby-progressbar'

# Create two progress bars with a total of 100 steps
progress_bar1 = ProgressBar.create(total: 100, format: '%t |%B| %c/%C %p%% %r')
progress_bar2 = ProgressBar.create(total: 100, format: '%t |%B| %c/%C %p%% %r')

# Update the progress bars in separate threads
thread1 = Thread.new do
  100.times do |step|
    progress_bar1.increment
    sleep 0.1 # Simulate some work
  end
end

thread2 = Thread.new do
  100.times do |step|
    progress_bar2.increment
    sleep 0.2 # Simulate different work
  end
end

# Wait for the threads to finish
thread1.join
thread2.join

# Finish the progress bars
progress_bar1.finish
progress_bar2.finish
