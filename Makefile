
main:
	cd source; make
	mv source/*assignment.Rmd tutorials/.
	mv source/*solution.Rmd solutions/.
	cd solutions; make
