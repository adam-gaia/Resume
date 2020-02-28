## Build instructions
```
brew cask install basictex # 'pdflatex' tool to render PDFs from LaTeX
brew install imagemagick # Convert from pdf to jpg for this README
git clone https://github.com/adam-gaia/Resume.git
make
open resume.pdf
```

## Makefile notes
The Makefile builds two copies of my resume:
* The version with my phone number + email that I submit to job apps. Ignored by git.
* The version on this repo without my contact info.
When forking this repo please create a file called './contactInfo_private.txt'. The Makefile uses this file for the untracked version.


## Preview
![Adam Gaia](./readmeResumeRender.jpg)
