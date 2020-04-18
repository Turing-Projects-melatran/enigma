require 'date'

class Offset
  attr_reader :date

  def initialize(date = Date.today.strftime("%d%m%y"))
    @date = date
  end

  def square
    (@date.to_i * @date.to_i).to_s
  end
end
