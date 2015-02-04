all: html pdf docx rtf render-index

pdf: resume.md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o resume.tex resume.md; \
	context resume.tex

html: style_chmduquesne.css resume.md
	pandoc --standalone -H style_chmduquesne.css \
        --from markdown --to html \
        -o resume.html resume.md
	# otherwise links are opened within iframe
	sed -i '' -e 's/href="[^"]*"/& target="_blank"/g' resume.html

docx: resume.md
	pandoc -s -S resume.md -o resume.docx

rtf: resume.md
	pandoc -s -S resume.md -o resume.rtf

render-index: resume.md
	./render-index.sh

clean:
	rm resume.html
	rm resume.tex
	rm resume.tuc
	rm resume.log
	rm resume.pdf
	rm resume.docx
	rm resume.rtf
