#! /usr/bin/make -f
# We get b0.csv by selecting all ETc in file_0_*.dss and exporting as csv
# For e0.csv we do the same with ETo
SHELL=/bin/bash

n=0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
b.csv:=$(patsubst %,b%.csv,${n})
e.csv:=$(patsubst %,e%.csv,${n})

header:=subarea,doy,date,time,c1,c10,c11,c12,c13,c14,c15,c2,c3,c4,c5,c6,c7,c8,c9

etc.csv: ${b.csv}
	echo ${header} >$@;
	for b in `seq 0 16`; do \
	 for i in `seq 0 9`; do \
	 let sa="$$b*10+$$i+1"; \
	 let s=i*15+4; let e=s+14; \
	 cut -d, -f 1-3,$$s-$$e < b$$b.csv | tail -n+6 | sed -e "s/^/$$sa,/";\
	 done; done | grep -v ^169, | grep -v ^170, >> $@

eto.csv: ${e.csv}
	echo ${header} >$@;
	for b in `seq 0 16`; do \
	 for i in `seq 0 9`; do \
	 let sa="$$b*10+$$i+1"; \
	 let s=i*15+4; let e=s+14; \
	 cut -d, -f 1-3,$$s-$$e < e$$b.csv | tail -n+6 | sed -e "s/^/$$sa,/";\
	 done; done | grep -v ^169, | grep -v ^170, >> $@

test.csv: ${b.csv}
	for b in `seq 0 16`; do \
	 for i in `seq 0 9`; do \
	 let sa="$$b*10+$$i+1"; \
	 let s=i*15+4; let e=s+14; \
	 cut -d, -f 1-3,$$s-$$e < b$$b.csv | sed -e "s/^/$$sa,/";\
	 done; done  > $@

test: ${b.csv}
	for b in `seq 0 16`; do \
	 for i in `seq 0 9`; do \
	 let sa="$$b*10+$$i+1"; \
	 let s=i*15+4; let e=s+14; \
	 echo "$$s-$$e, $$b $$sa";\
	 done; done

detaw_et_wy2015.tif:detaw_et_wy%.tif:
	gdal_translate -of GTiff -co "COMPRESS=DEFLATE" \
	  "PG:dbname='ssj' schema='detaw' table='et_raster' mode='1' where='type=\\'et\\' and year=$*'" $@
