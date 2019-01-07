require 'date'

class Course
  attr_accessor :name
  def initialize(name, f_inicio, f_termino)
    @name = name
    @f_inicio = Date.parse(f_inicio)
    @f_termino = Date.parse(f_termino)
  end

  def inicio(date = Date.today)
    fecha_invalida = Date.parse('2018-01-01')
    raise ArgumentError.new('Fecha invalida') if date == fecha_invalida
    puts @name, @f_termino if @f_termino > date
  end

  def termino(date = Date.today)
    fecha_invalida = Date.parse('2018-01-01')
    raise ArgumentError.new('Fecha invalida') if date == fecha_invalida
    puts @name, @f_inicio if @f_inicio > date
  end
end

def leer_archivo
  courses = []
  file = File.open('cursos.txt', 'r')
  data = file.readlines
  file.close
  data.each do |line|
    ls = line.split(', ')
    courses << Course.new(*ls)
  end
  courses
end

arr_c = leer_archivo

puts "\n\nCursos que inician antes de: (yyyy-mm-dd)"
antes = gets.chomp
antes = Date.parse(antes)
puts "\nInician antes de #{antes} los cursos:"
arr_c.each do |c|
  c.termino(antes)
end

puts "\nCursos que finalizan despues de: (yyyy-mm-dd)"
despues = gets.chomp
despues = Date.parse(despues)
puts "\nFinalizan despues de #{despues} los cursos:"
arr_c.each do |c|
  c.inicio(despues)
end
