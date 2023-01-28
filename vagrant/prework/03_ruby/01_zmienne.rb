#!/usr/bin/env ruby
# to jest komentarz
=begin
	to jest komentarz
	ktory ma wiele linii
=end

puts "Hejka" # pisz na ekran
zmienna_od = 1
zmienna_do = 10
# zmienne ktorych nazwa zaczynaja sie od $ sa globalne

lista = zmienna_od..zmienna_do # dwukropek to zakres, zwraca tablice
lista.each do |zmienna_it| # tablice maja metode each, ktora yielduje kolejne elementy
	puts "Jestem sobie #{zmienna_it}" # #{FOO} zostanie zastepione przez zawartosc zmiennej FOO
end # wiekszosc konstrukcji w ruby konczy sie endem
puts

if 1
	puts "1 jest traktowane jako prawda"
else
	puts "01: to sie nie powinno stac!"
end
puts

if false
	# false to logiczne 0 w ruby
	# true to logiczne 1 w ruby
	puts "02: to sie nie powinno stac!"
elsif nil # to nie literowka, w ruby to nie 'elseif', tylko 'elsif'
	# nil to 'nic' w ruby, jak NULL, None, null etc. w innych jezykach
	puts "03: to sie nie powinno stac!"
elsif 0
	puts "0 też jest traktowane jako prawda"
else
	puts "04: to sie nie powinno stac!"
end
puts

=begin
<<-COKOLWIEK
	foo
	bar
COKOLWIEK
to heredocs:
- https://www.rubyguides.com/2018/11/ruby-heredoc/
- https://linuxize.com/post/bash-heredoc/
=end

zmienna = "raz"

wielolinijkowa_zmienna = <<-EOM
	#{zmienna}
		ten tekst poprzedza tab (\t)(\\t)
	  ten tekst poprzedzaja spacje
EOM
puts "wielolinijkowa_zmienna"
puts wielolinijkowa_zmienna
puts

wielolinijkowa_zmienna_bez_indentacji = <<~EOM
	#{zmienna}
		ten tekst poprzedza tab (\t)(\\t)
	  ten tekst poprzedzaja spacje
EOM
puts "wielolinijkowa_zmienna_bez_indentacji"
puts wielolinijkowa_zmienna_bez_indentacji
puts

puts "tak sie dostaje do zmiennych srodowiskowych"
puts "shell to #{ENV['SHELL']}"
puts "#{ENV.to_a}"