# Run make in a dir and it will run strfile on most files in the dir

POSSIBLE += $(shell ls -1 | egrep -v '\.dat|README*|Makefile' | sed -e 's/$$/.dat/g')

all: ${POSSIBLE}

%.dat : %
	@strfile $< $@

clean:
	rm *.dat
