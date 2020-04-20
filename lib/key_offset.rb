require 'date'

class KeyOffset
  attr_reader :key, :date

  def initialize(key, date)
    @key = key
    @date = date
  end

  def generate_keys
    if @key.nil?
      @key = rand(0..9999).to_s.rjust(5, "0")
    else
      @key.to_s
    end
    make_keys
  end

  def make_keys
    split_string = @key.split('')
    {
      A: split_string[0..1].join.to_i,
      B: split_string[1..2].join.to_i,
      C: split_string[2..3].join.to_i,
      D: split_string[3..4].join.to_i
    }
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
    square = (@date.to_i * @date.to_i).to_s
    last_four = square.split('')[-4..-1]
    {
      A: last_four[0].to_i,
      B: last_four[1].to_i,
      C: last_four[2].to_i,
      D: last_four[3].to_i
    }
  end

  def make_shift
    hash = make_keys.merge(make_offset){|letter, key, offsets| key + offsets}
    hash.values
  end
end
