bolker_iowa2024.html: bolker_iowa2024.rmd timecomp.rds pix/nbr_graph.png
	Rscript -e "rmarkdown::render('bolker_iowa2024.rmd')"

timecomp.rds: timecomp.R
	R CMD BATCH --vanilla timecomp.R

pix/nbr_graph.png: ctv_network.R
	R CMD BATCH --vanilla ctv_network.R

