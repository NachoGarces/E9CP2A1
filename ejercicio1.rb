file = File.open('casino.txt', 'r')
data = file.readlines.map(&:chomp)
file.close

class Table
  attr_accessor :name, :recau
  def initialize(name, *recau)
    @name = name
    @recau = recau
  end

  def mayor
    dia = 1
    @recau.each do |d|
      if @recau.max == d
        break
      else
        dia += 1
      end
    end
    puts "La mayor recaudacion de la mesa #{@name} es #{@recau.max} el dia #{dia}"
  end

  def prom_recau
    total = 0
    @recau.each do |sum|
      total += sum.to_f
    end
    puts "El promedio de la #{@name} = #{total / @recau.size}"
  end
end

arr = []
data.each do |e|
  ls = e.split(', ')
  arr << Table.new(*ls)
end

arr.each(&:mayor)
arr.each(&:prom_recau)
