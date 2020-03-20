#
# built using mmark 2.

VERSION = 00
DOCNAME = draft-kucherawy-dmarc-dmarcbis

all: $(DOCNAME)-$(VERSION).txt $(DOCNAME)-$(VERSION).html

$(DOCNAME)-$(VERSION).txt: $(DOCNAME).xml
	@xml2rfc --text -o $@ $<
	@(echo "\`\`\`" > README.md; cat $@ >> README.md; echo "\`\`\`" >> README.md)
	@cp $@ README.md 

$(DOCNAME)-$(VERSION).html: $(DOCNAME).xml
	@xml2rfc --html -o $@ $<

$(DOCNAME).xml: $(DOCNAME).md
	@sed 's/@DOCNAME@/$(DOCNAME)-$(VERSION)/g' $< | mmark   > $@

clean:
	@rm -f $(DOCNAME)-$(VERSION).txt $(DOCNAME)-$(VERSION).html $(DOCNAME).xml
