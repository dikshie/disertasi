# VERY simple makefile to compile the thesis

mythesis.pdf: *.tex *.bib Makefile *.cls
	/usr/local/texlive/2013/bin/x86_64-darwin/latex mythesis
	/usr/local/texlive/2013/bin/x86_64-darwin/bibtex mythesis
	/usr/local/texlive/2013/bin/x86_64-darwin/latex mythesis
	/usr/local/texlive/2013/bin/x86_64-darwin/bibtex mythesis
	/usr/local/texlive/2013/bin/x86_64-darwin/pdflatex mythesis
	/usr/local/texlive/2013/bin/x86_64-darwin/bibtex mythesis
	/usr/local/texlive/2013/bin/x86_64-darwin/latex mythesis
	/usr/local/texlive/2013/bin/x86_64-darwin/bibtex mythesis
	/usr/local/texlive/2013/bin/x86_64-darwin/dvips -t a4 -G0 -o mythesis.ps mythesis.dvi
	ps2pdf -sPAPERSIZE=a4 -dMaxSubsetPct=100 -dCompatibilityLevel=1.3 -dSubsetFonts=true -dEmbedAllFonts=true -dAutoFilterColorImages=false -dAutoFilterGrayImages=false  -dColorImageFilter=/FlateEncode -dGrayImageFilter=/FlateEncode -dMonoImageFilter=/FlateEncode mythesis.ps mythesis.pdf

.PHONY: clean
clean:
	rm -f *.log *.dvi *.toc *.aux *.bbl *.blg *.pdf 

# vi:set noexpandtab:
