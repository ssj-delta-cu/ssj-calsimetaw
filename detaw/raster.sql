-- These scripts perform the rasterization of the DETAW data.

-- First, create a temporary table holding all the ETO data.
create temp table eto_poly as
with p as (
 select b,(st_dumpAsPolygons(rast,b)).*
 from cimis.eto,generate_series(1,365) as b
)
select b as dowy,
val as eto,
st_x(st_centroid(geom)) as east,
st_y(st_centroid(geom)) as north
from p;

-- create table of subareas intersected with cimis pixels.
create temp table sub_ew as
select
 subarea,east,north,
 st_intersection(d.wkb_geometry,c.boundary) as boundary
from detaw_subareas d
join calsimetaw.cimis c on st_intersects(d.wkb_geometry,c.boundary);

-- create a table that summarizes model_output by month using
-- cimis_pixel eto instead of subarea eto.  Sum over all days in month.
-- Result has predicted et for each detaw_num for each pixel
create temp table sub_ew_com_et as
with n as (
 select *, ymd-'2014-09-30'::date as dowy
 from detaw.model_output
),
r as (
 select
 extract(month from ymd) as month,
 subarea,east,north,
 detaw_num,
 count(*),
 sum(kc*c.eto) as et
 from sub_ew d join n using (subarea)
 join eto_poly c using (east,north,dowy)
 group by 1,2,3,4,5
)
select * from r;

-- Smaller table using array of data
create temp table sub_ew_com_et_bytearray as
select
subarea,east,north,detaw_num,
array_agg((et*10/count)::integer order by (month::integer+2)%12)
as daily_et,
sum(et) as yearly_et
from sub_ew_com_et
group by subarea,east,north,detaw_num;

-- Intersection of landuse data with calsimetaw data.
create table detaw.et as
select
subarea,east,north,c.level_2,
daily_et,
yearly_et,
st_intersection(d.boundary,l.boundary) as boundary
from sub_ew_com_et_bytearray
join sub_ew d using (subarea,east,north)
join detaw.crosswalk c using (detaw_num)
join landuse l on (c.level_2=l.level_2
and st_intersects(d.boundary,l.boundary));

-- Raster version.
create table detaw.et_raster as
with r as (select raster_template() as rast),
v(bt,nv) as (
VALUES(ARRAY['8BSI','8BSI','8BSI','8BSI','8BSI','8BSI','8BSI',
             '8BSI','8BSI','8BSI','8BSI','8BSI'],
        ARRAY[-127,-127,-127,-127,-127,-127,-127,-127,-127,-127,-127,-127])
)
select 2015 as year,
'et'::text as type,
st_union(st_asRaster(
st_transform(boundary,(st_metadata(r.rast)).srid),r.rast,bt,daily_et,nv)
 ) as rast
from detaw.et,r,v;

