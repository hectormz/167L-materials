## ---- build rules ----
labs_md := $(wildcard labs/*.md)
labs_pdf := $(patsubst labs/%.md, site/pdf/%.pdf, $(labs_md))

site/pdf/%.pdf: labs/%.md
	mkdir -p site/pdf
	pandoc --pdf-engine=pdflatex $< -o $@

all: $(labs_pdf)

# clean up everything
clean:
	rm -fr site
