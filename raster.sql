-- These scripts perform the rasterization of the CalSIMETAW data.

-- First, create a temporary table holding all the ETO data.
create temp table eto_poly as
with p as (
 select b,(st_dumpAsPolygons(rast,b)).*
 from cimis.eto_wy2015,generate_series(1,365) as b
)
select b as dowy,
val as eto,
st_x(st_centroid(geom)) as east,
st_y(st_centroid(geom)) as north
from p;

-- create table of dauco intersected with cimis pixels.
create temp table dauco_ew as
select
 dauco,east,north,
 st_intersection(d.geom,c.boundary) as boundary
from calsimetaw.dauco d
join calsimetaw.cimis c on st_intersects(d.geom,c.boundary);

-- create a table that summarizes model_output by month using cimis_pixel eto
-- instead of dauco output
create temp table dauco_ew_com_et as
with m as (
 select (year||'-'||mon||'-'||day)::date,*
 from calsimetaw.model_output_wy2015
),
n as (
 select m.*,
 date-'2014-09-30'::date as dowy
 from m
),
r as (
 select
 extract(month from date) as month,
 dauco,east,north,
 commodity,
 count(*),
 sum(ikc*c.eto) as iet,
 sum(okc*c.eto) as oet,
 sum(kc*c.eto) as et
 from dauco_ew d join n using (dauco)
 join eto_poly c using (east,north,dowy)
 group by 1,2,3,4,5
)
select * from r;

-- Smaller table using array of data
create temp table dauco_ew_com_et_bytearray as
select
dauco,east,north,commodity,
array_agg((iet*10/count)::integer order by (month::integer+2)%12)
as daily_iet,
array_agg((oet*10/count)::integer order by (month::integer+2)%12)
as daily_oet,
array_agg((et*10/count)::integer order by (month::integer+2)%12)
as daily_et,
sum(iet) as yearly_iet,
sum(oet) as yearly_oet,
sum(et) as yearly_et
from dauco_ew_com_et
group by dauco,east,north,commodity;

-- Intersection of landuse data with calsimetaw data.
create table calsimetaw.et_wy2015 as
select
dauco,east,north,c.level_2,
daily_et,daily_iet,daily_oet,
yearly_et,yearly_iet,yearly_oet,
st_intersection(d.boundary,l.boundary) as boundary
from dauco_ew_com_et_bytearray
join dauco_ew d using (dauco,east,north)
join calsimetaw.crosswalk c using (commodity)
join landuse_2015 l on (c.level_2=l.level_2
and st_intersects(d.boundary,l.boundary));

-- Raster version.
create table calsimetaw.et_raster as
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
from calsimetaw.et_wy2015,r,v
union
select 2015 as year,
'iet'::text as type,
st_union(st_asRaster(
st_transform(boundary,(st_metadata(r.rast)).srid),r.rast,bt,daily_iet,nv)
) as rast
from calsimetaw.et_wy2015,r,v;

