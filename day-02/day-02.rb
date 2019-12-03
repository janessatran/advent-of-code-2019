module Day2
  class << self
    def get_data
      File.open("./input.txt").read.strip
    end

    def part_one
      code = get_data.split(',').map(&:to_i)
      code[1] = 12
      code[2] = 2
      count = 0
      new_code = []
      code.each_slice(4) do |slice|
        opcode = slice[0]
        v1 = slice[1]
        v2 = slice[2]
        position = slice[3]
        break if opcode == 99
        if opcode == 1
          slice[position] = v1 + v2
        elsif opcode == 2
          slice[position] = v1 * v2
        end
        new_code << slice
      end
    end
  end
end