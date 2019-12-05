def find_passwords(input)
  input = input.split('-')
  start_val = input[0].to_i
  end_val = input[1].to_i
  valid_passwords = []

  (start_val..end_val).to_a.each do |password|
    valid_passwords << password if valid?(password)
  end

  pp valid_passwords.length
end

def valid?(password)
  password = password.to_s
  return false if password.length != 6
  same_adjacent_digits = false

  password.each_char.with_index do |val, idx|
    val = val.to_i
    if idx > 0
      return false if @prev > val
      same_adjacent_digits = true if @prev == val
    end
    @prev = val
  end
  if same_adjacent_digits
    return true
  else
    return false
  end
end

def find_passwords_part_two(input)
  input = input.split('-')
  start_val = input[0].to_i
  end_val = input[1].to_i
  valid_passwords = []

  (start_val..end_val).to_a.each do |password|
    valid_passwords << password if valid_part_two?(password)
  end

  pp valid_passwords.length
end

def valid_part_two?(password)
  password = password.to_s
  return false if password.length != 6
  same_adjacent_digits = false

  password.each_char.with_index do |val, idx|
    val = val.to_i
    if idx > 0
      return false if @prev > val
      same_adjacent_digits = true if password.count(val.to_s) == 2
    end
    @prev = val
  end
  if same_adjacent_digits
    return true
  else
    return false
  end
end

find_passwords('111111-111111')
# find_passwords('223450-223451')
find_passwords('153517-630395')
find_passwords_part_two('153517-630395')
