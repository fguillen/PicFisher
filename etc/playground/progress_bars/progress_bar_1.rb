require 'ruby-progressbar'

# Create a progress bar with a total of 100 steps
progress_bar = ProgressBar.create(total: 100)

# Update the progress bar in a loop
100.times do |step|
  progress_bar.increment
  sleep 0.1 # Simulate some work
end

# Finish the progress bar
progress_bar.finish
