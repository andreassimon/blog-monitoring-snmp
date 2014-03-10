default: snmp-analysis resized-screenshots html

html:
	erubis blog-entry.md.erb | markdown > blog-entry.html

resized-screenshots:
	convert response-times-vs-snmp.png    -resize 588x1024\> response-times-vs-snmp.scaled.png

load-test:
	rm response-times.csv
	jmeter -n -t simple.jmx

snmp-analysis:
	R CMD BATCH snmp.R

sample-data:
	tar -xvf data.tar.gz
