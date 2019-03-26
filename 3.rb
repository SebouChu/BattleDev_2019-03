input = Array.new
while i = $stdin.gets
	input << i.strip
end

n = input.shift.to_i
cmds = ""

def move(grid, target, n, cmds)
  grid.each_with_index do |line, i|
    line.each_with_index do |ground, j|
      $stderr.puts "#{i} - #{j}"
      cmds += "x" if ground == target
      if j == n-1
        # Limit
        if i == n-1
          return cmds
        else
          cmds += "v"
        end
      else
        # Even  (0, 2...) -> right
        # Odd   (1, 3...) -> left
        cmds = (i % 2 == 0) ? cmds + '>'
                            : cmds + '<'
      end
    end
  end
end

grid = input.map { |line| line.split('') }
grid.each_with_index do |line, index|
  line.reverse! if index % 2 == 1
end

cmds = move(grid, 'o', n, cmds)

(n-1).times.each do |_|
  cmds += "^"
end

(n-1).times.each do |_|
  cmds += "<"
end unless n % 2 == 0

cmds = move(grid, '*', n, cmds)

puts cmds