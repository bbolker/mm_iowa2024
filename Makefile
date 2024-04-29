%.html: %.rmd
	echo "rmarkdown::render(\"$<\",output_format='html_document')" | R --slave

docs/%.html: %.html
	mv $< $@

##%.pdf: %.rmd
##	echo "rmarkdown::render(\"$<\",output_format='tufte_handout')" | R --slave

notes = $(wildcard notes/*.rmd)
notepages = $(notes:%.rmd=docs/%.html)

pushnotes: $(notepages)
