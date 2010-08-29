ROOT=ttf-nobile

FONTS=$(ROOT)/nobile.ttf $(ROOT)/nobile_bold.ttf $(ROOT)/nobile_bold_italic.ttf $(ROOT)/nobile_italic.ttf

ttf-nobile_001.000-1_all.deb: $(FONTS)
	cd $(ROOT) && debuild -us -uc

$(FONTS):
	cd $(ROOT) && curl -O http://www.newtypography.co.uk/fonts/nobile.ttf
	cd $(ROOT) && curl -O http://www.newtypography.co.uk/fonts/nobile_bold.ttf
	cd $(ROOT) && curl -O http://www.newtypography.co.uk/fonts/nobile_bold_italic.ttf
	cd $(ROOT) && curl -O http://www.newtypography.co.uk/fonts/nobile_italic.ttf

install: ttf-nobile_001.000-1_all.deb
	dpkg -i ttf-nobile_001.000-1_all.deb

clean:
	rm -f ttf-nobile_001.* *~
	cd $(ROOT) && rm -f nobile*.ttf
	cd $(ROOT)/debian && rm -rf ttf-nobile.debhelper.log ttf-nobile.substvars ttf-nobile/
