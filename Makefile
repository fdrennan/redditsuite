build:
	rm -r man
	rm -r NAMESPACE
	R -e "devtools::document()"
	R -e "devtools::build()"

init:
	R -e "renv::consent(TRUE)"
	R -e "renv::restore()"

lazydev:
	git add --all
	git commit -m 'lazy commit'
	git push origin dev
