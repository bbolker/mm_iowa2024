%.html: %.rmd
	Rscript -e "rmarkdown::render(\"$<\",output_format='html_document')"

%.slides.html: %.rmd
	Rscript -e "rmarkdown::render(\"$<\",output_format='ioslides_presentation')"

docs/%.html: %.html
	mv $< $@

docs/slides/%.slides.html: notes/%.slides.html
	mv $< $@

##%.pdf: %.rmd
##	echo "rmarkdown::render(\"$<\",output_format='tufte_handout')" | R --slave

notes = $(wildcard notes/*.rmd)
notepages = $(notes:%.rmd=docs/%.html)

slides = $(wildcard notes/*.rmd)
slidepages = $(slides:%.rmd=docs/%.slides.html)

pushnotes: $(notepages)
