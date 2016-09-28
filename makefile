.SILENT:

complexity.o: complexity.cpp
	clang++ -Weverything -o $@ $<

clean:
	rm -f *.o

generate: complexity.o
	echo '## Big O Notation' > readme.md
	echo 'See [how this documentation is generated](install.md).' >> readme.md
	# Create image and add a link to it
	./complexity.o | gnuplot -p -e "set datafile separator ','; set output 'image/exponential.png'; set terminal png; plot '-' using 1:2 w l"
	echo '### Exponential' >> readme.md
	echo '![](image/exponential.png)' >> readme.md
