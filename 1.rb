input = Array.new
while i = $stdin.gets
	input << i.strip
end

place = input.shift.to_i

input.each do |data|
  front, back = data.split(' ').map(&:to_i)
  place = place + front - back
end

if place <= 100
    puts '1000'
elsif place > 10000
    puts 'KO'
else
    puts '100'
end