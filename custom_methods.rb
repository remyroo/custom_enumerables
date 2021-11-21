# rubocop:disable all

module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    for el in self do
      yield el
    end
    # for loop returns self once done
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    iterator = 0
    for el in self do
      yield el, iterator
      iterator += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    case self
    when Array
      result = []
      my_each { |el| result << el if yield(el) } # it's self.my_each but rubocop says that's redundant
    when Hash
      result = {}
      my_each { |el| result.store(el[0], el[1]) if yield(el) }
    end
    result
  end

  def my_all?(arg = nil)
    if arg
      my_each { |el| return false unless el == arg }
    elsif block_given?
      my_each { |el| return false unless yield(el) }
    else
      my_each { |el| return false unless el }
    end

    true
  end

  def my_any?(arg = nil)
    if arg
      my_each { |el| return true if el == arg }
    elsif block_given?
      my_each { |el| return true if yield(el) }
    else
      my_each { |el| return true if el }
    end

    false
  end

  def my_none?(arg = nil)
    if arg
      my_each { |el| return false if el == arg }
    elsif block_given?
      my_each { |el| return false if yield(el) }
    else
      my_each { |el| return false if el }
    end

    true
  end

  def my_count(arg = nil)
    return size if arg.nil? && !block_given?

    count = 0
    if arg
      my_each { |el| count += 1 if el == arg }
    else
      my_each { |el| count += 1 if yield(el) }
    end
    count
  end

  def my_map(proc = nil)
    if !block_given? && proc.nil?
      return to_enum(:my_map)
    end

    result = []
    if proc
      my_each { |el| result << proc.call(el) }
    else
      my_each { |el| result << yield(el) }
    end
    result
  end

  def my_inject(accumulator = nil, sym = nil)
    if accumulator.is_a?(Symbol)
      sym = accumulator
      accumulator = nil
    end

    input = is_a?(Range) ? to_a : self
    accum = accumulator.nil? ? input[0] : accumulator
    shifted = is_a?(Hash) ? drop(1) : input[1..-1]
    sym_block = ->(el) { accum = accum.send(sym, el) }
    standard_block = ->(el) { accum = yield(accum, el) }

    if accumulator && sym
      my_each(&sym_block)
    elsif accumulator
      my_each(&standard_block)
    elsif sym
      shifted.my_each(&sym_block)
    else
      shifted.my_each(&standard_block)
    end
    accum
  end


end

def multiply_els(arry)
  arry.my_inject(:*)
end
