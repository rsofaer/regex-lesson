while line = gets
  puts line if /.+@.+\..+/.match(line)
end
