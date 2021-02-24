inputFile = resume.tex
printOutputName = adamgaia
githubOutputName = adamgaia_githubVersion
jpgRenderName = readmeResumeRender

# Set default target
.DEFAULT_GOAL := print


# Compile a PDF with my contact info for job applications
# Verify the resume is only one page
# Update the README.md by running the 'github' target
print: $(inputFile) github
	@cat ./contactInfo_private.txt > ./contactInfo.txt # Copy *sensitive* info to be included in the makefile
	pdflatex -jobname=$(printOutputName) $(inputFile) > /dev/null 2>&1
	@rm contactInfo.txt || echo "Error, please make clean before publishing" # Clear contact info
	@grep --silent "Output written on ${printOutputName}.pdf (1 page," "${printOutputName}.log" || echo "Error, print resume is more than one page"
	@echo "Ready to print $(printOutputName).pdf"
	open $(printOutputName).pdf


# Compile a PDF without my contact info for viewing on Github.
# Verify the resume is only one page
# Create a jpg for the README.md
github: $(inputFile)
	@cat ./contactInfo_public.txt > ./contactInfo.txt # Copy non-sensitive info to be included in the makefile
	pdflatex -jobname=$(githubOutputName) $(inputFile) > /dev/null 2>&1
	@rm contactInfo.txt || echo "Error, please make clean before publishing" # Clear contact info
	convert -density 300 $(githubOutputName).pdf -quality 100 $(jpgRenderName).jpg
	@grep --silent "Output written on ${githubOutputName}.pdf (1 page," "${githubOutputName}.log" || echo "Error, github resume is more than one page"
	@echo "Updated resume for publishing on Github"


clean:
	rm -rf *.pdf *.jpg *.log *.aux contactInfo.txt > /dev/null 2>&1


# Resume tailored for Double River
doubleriver:
	@cat ./contactInfo_private.txt > ./contactInfo.txt # Copy *sensitive* info to be included in the makefile
	pdflatex -jobname=adam_gaia_double_river resume_double_river_version.tex > /dev/null 2>&1
	@rm contactInfo.txt || echo "Error, please make clean before publishing" # Clear contact info
	@grep --silent "Output written on adam_gaia_double_river.pdf (1 page," "adam_gaia_double_river.log" || echo "Error, print resume is more than one page"
	open adam_gaia_double_river.pdf
