all: Film.tex createFilm.sh
	bash createFilm.sh
	
clean: 
	rm *.log *.png *.pdf *.snm *.txt *.aux *.nav *.out *.toc *.mov *.sh~ *.tex~ Makefile~ *.gif
