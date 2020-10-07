PROJECT=potmux
REVISION=2
ZIPFILE=$(PROJECT)-r$(REVISION)-gerber.zip

all: $(ZIPFILE)

FILES=$(PROJECT).drl\
	$(PROJECT).gbl\
	$(PROJECT).gbs\
	$(PROJECT).gml\
	$(PROJECT).gtl\
	$(PROJECT).gto\
	$(PROJECT).gts

rename:
	$(shell [ -f $(PROJECT)-B_Cu.gbl ] && mv $(PROJECT)-B_Cu.gbl $(PROJECT).gbl)
	$(shell [ -f $(PROJECT)-B_Mask.gbs ] && mv $(PROJECT)-B_Mask.gbs $(PROJECT).gbs)
	$(shell [ -f $(PROJECT)-F_Cu.gtl ] && mv $(PROJECT)-F_Cu.gtl $(PROJECT).gtl)
	$(shell [ -f $(PROJECT)-F_Mask.gts ] && mv $(PROJECT)-F_Mask.gts $(PROJECT).gts)
	$(shell [ -f $(PROJECT)-F_SilkS.gto ] && mv $(PROJECT)-F_SilkS.gto $(PROJECT).gto)
	$(shell [ -f $(PROJECT)-B_SilkS.gbo ] && mv $(PROJECT)-B_SilkS.gbo $(PROJECT).gbo)
	$(shell [ -f $(PROJECT)-Edge_Cuts.gm1 ] && mv $(PROJECT)-Edge_Cuts.gm1 $(PROJECT).gml)
	$(shell chmod -x $(PROJECT)*)
        $(shell rm -f *.gbrjob)

$(ZIPFILE): rename $(FILES)
	zip $@ $(FILES)
	chmod -x $@

dirty: rename
	mv $(PROJECT).drl $(PROJECT).txt
	zip $(ZIPFILE) $(FILES) $(PROJECT).txt
	mv $(PROJECT).txt $(PROJECT).drl

clean:
	rm -f $(ZIPFILE)
