class Key
  attr_reader :number

  def initialize(number = rand(0..9999).to_s.rjust(5, "0"))
    @number = number
  end

  def make_keys
    {
      A: number[0..1].to_i,
      B: number[1..2].to_i,
      C: number[2..3].to_i,
      D: number[3..4].to_i
    }
  end
end
