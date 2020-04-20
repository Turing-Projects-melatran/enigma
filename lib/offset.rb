require 'date'

class Offset
  attr_reader :date

  def initialize(date = Date.today.strftime("%d%m%y"))
    @date = date
  end

  def square
    @date.to_i * @date.to_i
  end

  def make_offset
    {
      A: square.to_s[-4].to_i,
      B: square.to_s[-3].to_i,
      C: square.to_s[-2].to_i,
      D: square.to_s[-1].to_i
    }
  end
end
