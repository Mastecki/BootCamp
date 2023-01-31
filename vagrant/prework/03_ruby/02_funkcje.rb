#!/usr/bin/env ruby

smieszna_liczba = 69

# funkcje definiuje sie jako def nazwa(argument1, argument2, ..., argumentN),
# jesli nawiasy sa puste to nie ma argumentow
def funkcja_zwieksz_o_1(liczba)
	return liczba + 1
	# return mowi co funkcja ma zwrocic
	# nazywa sie to 'explicit return'
end # wiekszosc konstrukcji w ruby konczy sie endem

# funkcje wywoluje sie nazwa(argument1, argument2, ..., argumentN)
x = funkcja_zwieksz_o_1(1) 
puts x

# albo sie nazwa argument1, argument2, ..., argumentN
y = funkcja_zwieksz_o_1 1
puts y
puts

# tak jak mozna wypisywac zawartosc zmiennych, mozna tez wywolania funkcji
puts "001: 69+1 to #{funkcja_zwieksz_o_1(smieszna_liczba)}"
puts # pusta linia zeby latwiej sie Wam czytalo

def funkcja_zwieksz_o_1_implicit_return(liczba)
	liczba = liczba + 1
	# jesli nie damy nigdzie 'return', to zostanie zwrocony wynik ostatniego wyrażenia
	# komentarze nie sa zwracane :)
	# nazywa sie to 'implicit return'
end
puts "002: 69+1 to #{funkcja_zwieksz_o_1_implicit_return(smieszna_liczba)}"
puts

def funkcja_zwieksz_o_1_yield(liczba)
	liczba = liczba + 1
	yield liczba
	# yield dziala podobnie do return
	# gdy wywolujemy funkcje w tym samym scope
	# jest wykonywana do 1szego yielda, wynik jest zwracany, i interpreter wraca do miejsca z ktorego byla funkcja wywolana
	liczba = liczba + 10
	# przy kolejnym wywolaniu funkcji w tym samym scope, zaczyna sie od miesja w ktorym poprzednim razem sie zakonczylo
	# czyli po ostatnio zwroconym yield
	yield liczba
	yield "69+1"
	# nie bede tlumaczyl czym jest scope, wykracza to poza nasze potrzeby
	# przy yield nie ma 'implicit return'
end


# puts "69+1 to #{funkcja_zwieksz_o_1_yield(smieszna_liczba)}" # nie zadziala
# funkcje z yield wymagaja podania im bloku kodu do wykonania
# albo przez {|argument| kod_bloku}
# albo przez do |argument| kod_bloku end

# przyklad z {|argument| kod_bloku}
# jesli jest wiecej yield niz 1, wykonaj kod_bloku dla kazdego z osobna
funkcja_zwieksz_o_1_yield(smieszna_liczba) {|wynik|
	puts "003: 69+1 to #{wynik}"
} # newline dodane dla czytelnosci, nie musi ich byc
puts

# przyklad z  do |argument| kod_bloku end
# jesli jest wiecej yield niz 1, wykonaj kod_bloku dla kazdego z osobna
funkcja_zwieksz_o_1_yield(smieszna_liczba) do |wynik|
	puts "004: 69+1 to #{wynik}"
end
puts

# jesli "docelowe" miejsce funkcji z yield spodziewa sie pojedynczego wyniku, zwroc ostatni
puts "005: 69+1 to #{
	funkcja_zwieksz_o_1_yield(smieszna_liczba) { |wynik|
		puts "005: po drodze bylo #{wynik}"
		wynik # implicit return
	}}"
#"
puts

# niedzialajacy przyklad z return
funkcja_zwieksz_o_1(smieszna_liczba) do |wynik|
	# nigdy tutaj nie wejdziemy
	# bo funkcja_zwieksz_o_1 uzywa return a nie yield
	puts "006: 69+1 to #{wynik}"
end
puts

# Przyklady praktyczne:

puts "Przyklad z return"
def funkcja_3kolejne_return(liczba)
	return \
		liczba, \
		liczba + 1, \
		liczba + 2
end

# petla for each dla tablic
puts funkcja_3kolejne_return(20)
if [20, 21, 22] == funkcja_3kolejne_return(20)
	puts "return z przecinkiem zwraca tablice"
end

funkcja_3kolejne_return(20).each do |zmienna_it|
	puts "Jestem sobie #{zmienna_it}"
end
puts

puts "Przyklad z yield"
def funkcja_3kolejne_yield(liczba)
	yield liczba
	yield liczba + 1
	yield liczba + 2
end


# petla for each dla yieldowanych elementow
funkcja_3kolejne_yield(20) {|wynik| puts wynik}
funkcja_3kolejne_yield(20) do |zmienna_it|
	puts "Jestem sobie #{zmienna_it}"
end
puts