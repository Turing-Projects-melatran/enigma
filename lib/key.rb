class Key

  attr_reader :key

  def initialize(key = rand(0..9999).to_s.rjust(5, "0"))
    @key = key
  end

  def make_keys
    {
      A: key[0..1].to_i,
      B: key[1..2].to_i,
      C: key[2..3].to_i,
      D: key[3..4].to_i
    }
  end
end
