require 'date'

class Offset
  attr_reader :date

  def initialize(date = nil)
    @date = date
  end

  def generate_offset
    if @date.nil?
      @date = Date.today.strftime("%d%m%y")
    else
      @date.to_s
    end
    make_offset
  end

  def make_offset
    number = (@date.to_i * @date.to_i).to_s
    last_four = number.split('')[-4..-1]
    {
      A: last_four[0].to_i,
      B: last_four[1].to_i,
      C: last_four[2].to_i,
      D: last_four[3].to_i
    }
  end
end
