require 'date'

class Offset
  attr_reader :date

  def initialize(date = Date.today.strftime("%d%m%y"))
    @date = date
  end
  
  def make_offset
    square = (@date.to_i * @date.to_i).to_s
    last_four = square.split('')[-4..-1]
    {
      A: last_four[0].to_i,
      B: last_four[1].to_i,
      C: last_four[2].to_i,
      D: last_four[3].to_i
    }
  end
end
