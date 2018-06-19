## ---- build rules ----
labs_md := $(wildcard labs/*.md)
labs_pdf := $(patsubst labs/%.md, site/pdf/%.pdf, $(labs_md))

site/pdf/%.pdf: labs/%.md
	mkdir -p site/pdf
	pandoc -s -V geometry:margin=1in -V fontfamily:helvet -V fontfamilyoptions:scaled --pdf-engine=pdflatex -f markdown $< -o $@

all: $(labs_pdf)

# clean up everything
clean:
	rm -fr site
