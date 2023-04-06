SRC := $(wildcard *main.Rmd)
ASSIGNMENTS := $(subst main,assignment,$(SRC))
SOLUTIONS := $(subst main,solution,$(SRC))
OS := $(shell uname)

all: ${ASSIGNMENTS} ${SOLUTIONS}

ifeq ($(OS),Darwin)
%assignment.Rmd: %main.Rmd
	sed -E \
	-e '/<!-- solution-begin -->/,/<!-- solution-end -->/d' \
	-e '/# solution-begin/,/# solution-end/d' \
	-e '/# task-(begin|end)/d' \
	-e '/<!-- task-(begin|end)/d' \
	-e '/<!-- include-exit-ticket -->/ r exit-ticket.md' \
	< $< > $@
	# Replace e-code-target
	sed -i '' "s/e-code-target/$@/g" $@
else
%assignment.Rmd: %main.Rmd
	sed -E \
	-e '/<!-- solution-begin -->/,/<!-- solution-end -->/d' \
	-e '/# solution-begin/,/# solution-end/d' \
	-e '/# task-(begin|end)/d' \
	-e '/<!-- task-(begin|end)/d' \
	-e '/<!-- include-exit-ticket -->/ r exit-ticket.md' \
	< $< > $@
	# Replace e-code-target
	sed -i "s/e-code-target/$@/g" $@
endif


%solution.Rmd: %main.Rmd
	sed -E \
	-e '/^---/,/---/d' \
	-e '/<!-- task-begin -->/,/<!-- task-end -->/d' \
	-e '/# task-begin/,/# task-end/d' \
	-e '/# solution-(begin|end)/d' \
	-e '/<!-- solution-(begin|end)/d' \
	< $< > $@

clean:
	rm -f *assignment.Rmd *solution.Rmd
