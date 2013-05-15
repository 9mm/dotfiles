begin 
  # load and initialize wirble
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError => err
    $stderr.puts "Couldn't load Wirble: #{err}"
end
