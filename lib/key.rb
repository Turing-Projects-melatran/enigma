class Key
  attr_reader :number, :keys

  def initialize(number = generate_random)
    @number = number
    @keys = {}
  end

  def generate_random
    rand(0..9999).to_s.rjust(5, "0")
  end

  def split_string
    @number.split('')
  end
end
