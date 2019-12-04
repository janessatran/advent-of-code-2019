require 'set'

def get_data
  File.open("./input.txt").read
end

def walk_path(path)
  x = 0
  y = 0
  recorded_path = Set.new
  path.split(',').each do |step|
    direction = step[0]
    distance = step[1..].to_i
    distance.times do
      case direction
      when "R"
        x += 1
      when "L"
        x -= 1
      when "U"
        y += 1
      when "D"
        y -= 1
      end
      recorded_path.add([x,y])
    end
  end
  recorded_path
end

def count_steps(path)
  x = 0
  y = 0
  recorded_path = Hash.new
  step_count = 1

  path.split(',').each do |step|
    direction = step[0]
    distance = step[1..].to_i
    distance.times do
      case direction
      when "R"
        x += 1
      when "L"
        x -= 1
      when "U"
        y += 1
      when "D"
        y -= 1
      end
      recorded_path[[x,y]] = step_count unless recorded_path[[x,y]]
      step_count += 1
    end
  end
  recorded_path
end

def part_one
  paths = get_data.split("\n")
  first_path = walk_path(paths[0])
  second_path = walk_path(paths[1])
  intersection = first_path & second_path
  manhattan_distance = intersection.map { |x,y| x.abs + y.abs }
  min_distance = manhattan_distance.min
  pp min_distance
end

part_one

def part_two
  paths = get_data.split("\n")
  first_path = count_steps(paths[0])
  second_path = count_steps(paths[1])
  intersection = first_path.keys & second_path.keys
  steps_distance = intersection.map { |x,y|first_path[[x,y]] + second_path[[x,y]] }
  min_steps = steps_distance.min
  pp min_steps
end

part_two