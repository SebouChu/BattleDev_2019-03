input = Array.new
while i = $stdin.gets
	input << i.strip
end

def is_common(test_string, strings)
	common = true
	strings.each do |string|
    unless string.include? test_string
      common = false
      break
    end
  end
	return common
end

def get_common_string(strings)
	strings.delete('')
	strings.sort! { |x,y| x.size <=> y.size }
	base = strings.first
	letters_count = base.size

	max_common_str = (0..letters_count-1).map { |i|
		(i..letters_count-1).map { |j|
			is_common(base[i..j], strings) ? base[i..j] : ''
		}.max { |s1, s2| s1.size <=> s2.size }
	}.max { |s1, s2| s1.size <=> s2.size }

	$stderr.puts "===="
	$stderr.puts strings.to_s
	$stderr.puts max_common_str
	$stderr.puts "===="

	return max_common_str
end

def solve(input, common_letters)
  duplicate = input.dup
	$stderr.puts input.to_s
  duplicate = duplicate.map do |word|
    word.select { |letter| common_letters.include?(letter) }.join('')
  end

	return get_common_string(duplicate)
end

input.shift
input = input.map { |word| word.split('') }

duplicate = input.dup
common_letters = []
duplicate.first.each do |letter|
	$stderr.puts letter
  common = true
  duplicate.each do |word|
    unless word.include? letter
      common = false
      break
    end
  end
  if common
    common_letters << letter
    duplicate.each_with_index do |word, i|
      next if i == 0
      word.slice!(word.index(letter))
    end
  end
end

if common_letters.size.zero?
  puts 'KO'
else
  puts solve(input, common_letters)
end