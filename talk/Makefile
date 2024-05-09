bolker_iowa2024.html: bolker_iowa2024.rmd timecomp.rds
	Rscript -e "rmarkdown::render('bolker_iowa2024.rmd')"

timecomp.rds: timecomp.R
	R CMD BATCH --vanilla timecomp.R
