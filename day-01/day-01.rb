input_data = File.open("input.txt")

def calculate_fuel(mass)
  (mass/3).floor - 2
end

fuel_reqs = []

input_data.each do |m|
  fuel_reqs << calculate_fuel(m.to_i)
end

total_fuel = fuel_reqs.inject(:+)

# part 2
