#! /usr/bin/make -f

header:=DAUCo,commodity,Year,Mon,Day,DOY,Area,OKc,IKc,CCKc,ETo,Kc,ETc,Pcp,Er,Spg,Espg,SWD,SWDx,FC,PWP,SWC,YT,NA

INFO:
	echo 'Make input for postgresql from CalSIMETAW outputs.'

model_output.csv:
	echo $(header) > $@ 
	for i in DAUCo_*.csv; do \
	  y=`basename "$$i" .csv | tr -d ' ' | cut -d- -f 2`; \
	  c=`echo $$y | cut -d_ -f1`; \
	  d=`echo $$y | cut -d_ -f3`; \
	  cut -d, -f1-22 < "$$i" | tail -n+4 | sed -e "s/^/$$d,$$c,/"; \
	done >> $@
