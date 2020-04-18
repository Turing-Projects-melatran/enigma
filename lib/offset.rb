require 'date'

class Offset
  attr_reader :date

  def initialize(date = current_date)
    @date = date
  end

  def current_date
    Date.today.strftime("%d%m%y")
  end

  def square
    (@date.to_i * @date.to_i).to_s
  end

  def last_four
    square.split('')[-4..-1]
  end

  def make_offset
    {
      A: last_four[0].to_i,
      B: last_four[1].to_i,
      C: last_four[2].to_i,
      D: last_four[3].to_i
    }
  end
end
