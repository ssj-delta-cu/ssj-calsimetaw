#! /usr/bin/make -f

SHELL:=/bin/bash

db:=ssj
schema:=calsimetaw
PG:=psql -d ${db}
OGR:=ogr2ogr -f "PostgreSQL" PG:"dbname=${db} port=5433" -overwrite -a_srs epsg:4269 -t_srs epsg:3310

.PHONY:import

import: dau grid eto
# This just rebuilds everytime
dau: tar:=v2.0.0.tar.gz
dau: url:=https://github.com/ucd-cws/dwr-dau/archive/v2.0.0.tar.gz
dau: geojson:=dwr-dau-2.0.0/detailed_analysis_units.geojson
dau:
	[[ -f ${tar} ]] || wget ${url}
	tar -xzf ${tar}
	${OGR} -nln ${schema}.dau ${geojson}
	date > $@

grid: tar:=v1.0.0.tar.gz
grid: url:=https://github.com/CSTARS/dwr-grid/archive/v1.0.0.tar.gz
grid: cimis:=dwr-grid-1.0.0/shp/cimis.shp
grid: calsimetaw:=dwr-grid-1.0.0/shp/calsimetaw.shp
grid:
	[[ -f ${tar} ]] || wget ${url}
	tar -xzf ${tar}
	shp2pgsql -d -S -I -g boundary -s 3310 ${cimis} ${schema}.cimis | ${PG} > /dev/null
	shp2pgsql -d -S -I -g boundary -s 3310 ${calsimetaw} ${schema}.calsimetaw | ${PG} > /dev/null
	date > $@

eto:rast:=${HOME}/ssj-weather/cimis/2015.wy/ETo.tif
eto:
	raster2pgsql -d ${rast} cimis.eto | ${PG} -f -
	date > $@

bbox: bbox:=/home/quinn/ssj-overview/ssj-delta-cu-bbox.geojson
bbox:
	${OGR} -nln overview.bbox ${bbox}
	date > $@ 


et_wy2015.tif:et_wy%.tif:
	gdal_translate -of GTiff -co "COMPRESS=DEFLATE" \
	  "PG:dbname='ssj' schema='calsimetaw' table='et_raster' mode='1' where='type=\\'et\\' and year=$*'" $@

iet_wy2015.tif:iet_wy%.tif:
	gdal_translate -of GTiff -co "COMPRESS=DEFLATE" \
	  "PG:dbname='ssj' schema='calsimetaw' table='et_raster' mode='1' where='type=\'iet\' and year=$*'" $@

# Getting DWR values
#for i in `psql service=ssj -A -t --pset=footer -c 'with a as (select dwr_id,boundary,wkb_geometry,(st_area(st_intersection(g.boundary,b.wkb_geometry)))::int as area from calsimetaw.calsimetaw g join overview.bbox b on st_intersects(g.boundary,b.wkb_geometry)) select dwr_id from a where area > 0 order by dwr_id' `; do rsync ../weather/cimis_$i.csv . -v ; done

