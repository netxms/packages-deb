all: control rules

DIST?=unknown
PROFILE?=unknown

M4_WITH_ARGS=m4 -I config/$(DIST)-$(PROFILE) -I config/$(DIST) -I config/default

control: control.m4
	$(M4_WITH_ARGS) control.m4 > control

rules: rules.m4
	$(M4_WITH_ARGS) rules.m4 > rules

clean:
	rm -f control rules
