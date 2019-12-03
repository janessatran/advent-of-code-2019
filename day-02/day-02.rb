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
      code.each_slice(4) do |opcode, v1, v2, position|
        break if opcode == 99
        if opcode == 1
          code[position] = code[v1] + code[v2]
        elsif opcode == 2
          code[position] = code[v1] * code[v2]
        end
      end
    end

    def part_two(noun, verb)
      code = get_data.split(',').map(&:to_i)
      code[1] = noun
      code[2] = verb
      count = 0
      code.each_slice(4) do |opcode, v1, v2, position|
        break if opcode == 99
        if opcode == 1
          code[position] = code[v1] + code[v2]
        elsif opcode == 2
          code[position] = code[v1] * code[v2]
        end
      end
      code[0]
    end

    def get_answer_part_two
      (0..99).each do |noun|
        (0..99).each do |verb|
          result = part_two(noun, verb)
          if result == 19690720
            puts "noun: #{noun}, verb: #{verb}, answer: #{100 * noun + verb}"
          end
        end
      end
    end
  end
end