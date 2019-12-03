module Day1
  class << self
    def get_data
      File.open("./input.txt")
    end

    def calculate_fuel(mass)
      (mass/3).floor - 2
    end

    def part_one
      masses = get_data
      masses.map(&:to_i).sum { |mass| calculate_fuel(mass) }
    end

    def part_two
      masses = get_data.map(&:to_i)
      fuel_reqs = []
      masses.each do |mass|
        total_fuel = 0
        while mass > 0
          mass = calculate_fuel(mass)
          total_fuel += mass if mass > 0
        end
        fuel_reqs << total_fuel
      end
      fuel_reqs.sum
    end
  end
end