class Key
  attr_reader :number

  def initialize(number = generate_random)
    @number = number
  end

  def generate_random
    rand(0..9999).to_s.rjust(5, "0")
  end

  def split_string
    @number.split('')
  end

  def make_keys
    keys = {
      A: split_string[0..1].join.to_i,
      B: split_string[1..2].join.to_i,
      C: split_string[2..3].join.to_i,
      D: split_string[3..4].join.to_i
    }
    keys
  end
end
