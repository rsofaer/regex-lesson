regex = /([^,+@]+)(\+[^,+@]+)?(@[^,@]+\.[^@,]+)/
while line = gets
  matches = regex.match(line)
  puts matches[1].gsub('.','') + matches[3]
end
