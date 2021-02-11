build: document
	R -e "devtools::build()"

document: style
	R -e "devtools::document()"

style:
	R -e "styler::style_dir('R')"

init:
	R -e "renv::consent(TRUE)"
	R -e "renv::restore()"

lazydev:
	git add --all
	git commit -m 'lazy commit'
	git push origin dev
