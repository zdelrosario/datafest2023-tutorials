SRC := $(wildcard *solution.Rmd)
SOLUTIONS := $(subst Rmd,md,$(SRC))

all: ${SOLUTIONS}

%.md: %.Rmd
	Rscript -e 'rmarkdown::render("$<", "github_document")'
