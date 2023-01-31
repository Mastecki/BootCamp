#!/usr/bin/env ruby

# funkcja zeby inaczej konwertowac na string
def nil_s(moze_nil)
	if moze_nil
		# to nie nil
		return "\"#{moze_nil}\""
	end
	return "nil"
end

# funkcja do testowania klas
def dzialaj(costam)
	costam.a = 'A1'
	puts "costam to #{costam} na poczatku"

	# kopia instancji w funkcji
	def funkcja_rob(cokolwiek)
		rezult = cokolwiek.dup # zwroc kopie obiektu cokolwiek
		rezult.b = 'B2'
		rezult.c = 'C3'
		puts "rezult to #{rezult}"
		yield rezult
	end

	# operacja na wyniku funkcji
	funkcja_rob(costam) do |srodek|
		srodek.d = 'D4'
		puts "srodek to #{srodek}"
	end
	puts "costam to #{costam} na koncu"
end

# przyklad minimalnej klasy z jakimis polami
class Minimalna
	# zdefiniuj zmienne ktore naleza do instancji/obiektu tej klasy
	@a
	@b
	@c
	@d
	# stworz domyslne metody pozwalajace dostac sie do tych pol z zewnatrz
	attr_accessor :a, :b, :c, :d
end

puts "dzialaj z minimalna klasa"
minimalna = Minimalna.new() # domyslnie new nie przyjmuje zadnych argumentow 
minimalna.a = 'aa11'
puts "przed dzialaniem: #{minimalna}, #{minimalna.a}"
# #{minimalna} zwrocil adres obiektu w pamieci, nie zawartosc
dzialaj(minimalna)
puts


# przyklad klasy z jakimis polami ktora ma jakies uzyteczne metody
class Uzyteczna
	attr_accessor :a, :b, :c, :d
	# initialize jest wywolywany przez new, odpowiada za przypisanie zmiennych
	def initialize(a=nil, b=nil, c=nil, d=nil)
		@a = a
		@b = b
		@c = c
		@d = d
	end
	def to_s()
		"a=#{nil_s(a)}, b=#{nil_s(b)}, c=#{nil_s(c)}, d=#{nil_s(d)}"
	end
end

puts "dzialaj z uzyteczna klasa"
uzyteczna = Uzyteczna.new('aa11')
puts "przed dzialaniem: #{uzyteczna}, #{uzyteczna.a}"
# #{uzyteczna} zwrocil zawartosc obiektu korzystajac z metody to_s
dzialaj(uzyteczna)
puts

# przyklad Stuct, takiej nakladki na class
Strukt = Struct.new(
	:a,
	:b,
	:c,
	:d
)
puts "dzialaj ze struktem"
strukt = Strukt.new('aa11')
puts "przed dzialaniem: #{strukt}, #{strukt.a}"
# #{strukt} zwrocil zawartosc obiektu
dzialaj(strukt)
puts


