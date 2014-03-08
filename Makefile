default: resize-screenshots html

html:
	erubis blog-entry.md.erb | markdown > blog-entry.html

resize-screenshots:
	# convert response-times.png    -resize 588x1024\> response-times.scaled.png
	# convert response-codes.png    -resize 588x1024\> response-codes.scaled.png
	# convert quantiles.png         -resize 588x1024\> quantiles.scaled.png

load-test:
	rm response-times.csv
	jmeter -n -t simple.jmx

snmp-analysis:
	R CMD BATCH snmp.R
