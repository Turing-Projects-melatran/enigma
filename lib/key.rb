class Key
  attr_reader :number

  def initialize(number = nil)
    @number = number
  end

  def generate_keys
    if @number.nil?
      rand(0..9999).to_s.rjust(5, "0")
    else
      @number.to_s
    end
  end

  def split_string
    @number.split('')
  end

  def make_keys
    {
      A: split_string[0..1].join.to_i,
      B: split_string[1..2].join.to_i,
      C: split_string[2..3].join.to_i,
      D: split_string[3..4].join.to_i
    }
  end
end
