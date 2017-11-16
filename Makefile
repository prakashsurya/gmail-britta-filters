INPUTS := $(wildcard ./input/*.rb)
OUTPUTS := $(patsubst ./input/%.rb,./output/%.xml,$(INPUTS))

all: $(OUTPUTS)

clean:
	rm -f $(OUTPUTS)

./output/%.xml: ./input/%.rb
	ruby $< > $@
