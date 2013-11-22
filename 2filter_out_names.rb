regex =/([^,]+@[^,]+\.[^,]+)(,.+)?/
while line=gets
  matches = regex.match(line)
  puts matches[1] if matches
end
