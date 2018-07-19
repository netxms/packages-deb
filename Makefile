all: control rules

control: control.m4
	m4 -I config/$(DIST) -I config/default control.m4 > control

rules: rules.m4
	m4 -I config/$(DIST) -I config/default rules.m4 > rules

clean:
	rm -f control rules
