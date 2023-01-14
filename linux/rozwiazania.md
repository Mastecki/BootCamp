# Linux - rozwiazania zadan

## Zadanie 1

1. 

	cat /etc/passwd | awk -F: '{print($1" - "$6)}'

2.

	du -sh * | sort -h | tail -n5
	
3.

	cat SpisMiejscowosci.txt | grep -c ^W
	grep -c ^W SpisMiejscowosci.txt
	
4.

	grep -cw Zimno SpisMiejscowosci.txt
	cat SpisMiejscowosci.txt | grep -w Zimno | wc -l
