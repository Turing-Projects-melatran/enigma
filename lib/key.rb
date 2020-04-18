class Key
  attr_reader :number, :keys

  def initialize(number = generate_random)
    @number = number
    @keys = {}
  end

  def generate_random
    rand(0..9999).to_s.rjust(5, "0")
  end
end


#"%05d" padded zeroes
#generate a hash A: 1 B: 2 ...
# puts 1.to_s.rjust(3, "0")
# #=> 001
# puts 10.to_s.rjust(3, "0")
# #=> 010
# puts 100.to_s.rjust(3, "0")
# #=> 100

#= rand(0..9999).to_s.rjust(5, "0")
