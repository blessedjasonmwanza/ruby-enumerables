require_relative './enumerables'

class MyList
  include Enumerable
  def initialize(*list)
    @list = list
  end

  # method yeild each successive members of @list
  def each()
    return to_enum(:each) unless block_given?

    counter = 0
    while counter < @list.size
      yield @list[counter]
      counter += 1
    end
    @list
  end
end

list = MyList.new(1, 2, 3, 4)
# <MyList: @list=[1, 2, 3, 4]>

puts list.all? { |e| e < 5 }
# true

puts list.all? { |e| e > 5 }
# false

puts list.any? { |e| e == 2 }
# true

puts list.any? { |e| e == 5 }
# false

puts list.filter(&:even?)
# 2
# 4
