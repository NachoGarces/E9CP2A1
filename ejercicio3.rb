class Roulette
  def initialize
    @r = (1..10).to_a
  end

  def play(us_apuesta)
    @res = @r.sample
    if us_apuesta == @res
      wins(@res)
      puts 'Ganaste! Genial!'
    else
      history(@res)
      puts 'Pierdes. Mejor suerte a la proxima'
    end
  end

  def history(news)
    File.open('roulette_history.txt', 'a') { |d| d.puts(news) }
  end

  def wins(winner)
    File.open('winners.txt', 'a') { |d| d.puts(winner) }
    File.open('roulette_history.txt', 'a') { |d| d.print(winner, ": Ganador\n") }
  end

  def mas
    my = []
    file = File.open('roulette_history.txt', 'r')
    data = file.readlines
    file.close
    data.each { |d| my << d.to_i }
    my.max_by { |n| my.count(n) }
  end
end

h = Roulette.new
h.play(10)
puts "\nEl numero mas generado por la ruleta es: #{h.mas}"
