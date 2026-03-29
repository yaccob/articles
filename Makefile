SRCDIR  := src
DOCSDIR := docs

ADOC_SOURCES := $(shell find $(SRCDIR) -name '*.adoc')
HTML_TARGETS := $(patsubst $(SRCDIR)/%.adoc,$(DOCSDIR)/%.html,$(ADOC_SOURCES))

.PHONY: all clean

all: $(HTML_TARGETS)

$(DOCSDIR)/%.html: $(SRCDIR)/%.adoc
	@mkdir -p $(dir $@)
	asciidoctor -r asciidoctor-diagram \
		-a imagesoutdir=$(dir $@)img \
		-a imagesdir=img \
		-o $@ $<

clean:
	rm -rf $(DOCSDIR)/*
