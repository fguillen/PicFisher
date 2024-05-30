# Prints a text-based progress bar representing 0 to 100 percent. Each"=" # sign represents 5 percent
0.step(100, 5) do |i|
  printf("\rProgress: [%-20s]", "=" * (i/5))
  sleep(0.5)
end
puts
