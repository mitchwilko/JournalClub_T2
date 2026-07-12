MAINFILE=presentation
BUILDDIR=ltxBuild

LATEXMK=latexmk
LATEXFLAGS = -pdf \
						 -outdir=$(BUILDDIR) \
						 -interaction=nonstopmode \
						 -halt-on-error \
						 -silent

HTTPPORT=8082

pdf:
	mkdir -p $(BUILDDIR)
	$(LATEXMK) $(LATEXFLAGS) $(MAINFILE).tex


watch:
	mkdir -p $(BUILDDIR)
	$(LATEXMK) $(LATEXFLAGS) -pvc $(MAINFILE).tex

clean:
	$(LATEXMK) -C
	rm -rf $(BUILDDIR)

server:
	python3 -m http.server $(HTTPPORT)

jupyter:
	cd Working
	conda init
	conda activate wolfram
	jupyter lab --no-browser --ip=100.78.53.71 --port=8889
