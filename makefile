# Ultimately we want to end up with some images
all: readme.md exponential.png linear.png

# Initialise the readme if not present
readme.md:
	echo '## Big O Notation' > readme.md
	echo 'See [how this documentation is generated](install.md).' >> readme.md

# Define how to create an object from a source file
%.o:%.cpp
	clang++ -Weverything -o $@ $<

# And how to create an image from an object
%.png:%.o
	./$< | gnuplot -p -e "set datafile separator ','; set output '"$@"'; set terminal png; plot '-' using 1:2 w l"
	echo "### $(basename $@)" >> readme.md
	echo "![]($@)" >> readme.md

# Remove all objects, images and generated readme
clean:
	rm -f *.png *.o readme.md
