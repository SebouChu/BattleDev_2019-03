input = Array.new
while i = $stdin.gets
	input << i.strip
end

input.shift
arCount = 0
p = 0

input = input.map(&:to_i)
input.each_with_index do |pBox, index|
  if p + pBox > 100
    arCount += 1
    p = 0
  end

  p += pBox
end

puts arCount + 1