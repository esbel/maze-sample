def print_maze(output, maze, width, height)
  x, y = 0, 0

  puts " " + "_" * (width * 2 - 1)
  height.times do |y|
    output.print "|"
    width.times do |x|
      output.print((grid[y][x] & Coordinates::S != 0) ? " " : "_")
      if grid[y][x] & Coordinates::E != 0
        output.print(((grid[y][x] | grid[y][x+1]) & Coordinates::S != 0) ? " " : "_")
      else
        output.print "|"
      end
    end
    puts
  end
end
