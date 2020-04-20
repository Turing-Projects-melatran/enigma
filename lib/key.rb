class Key
  attr_reader :number

  def initialize(number = rand(0..9999).to_s.rjust(5, "0"))
    @number = number
  end
  
  def make_keys
    split_string = @number.split('')
    {
      A: split_string[0..1].join.to_i,
      B: split_string[1..2].join.to_i,
      C: split_string[2..3].join.to_i,
      D: split_string[3..4].join.to_i
    }
  end
end
