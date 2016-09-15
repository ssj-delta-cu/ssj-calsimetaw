set search_path=detaw,public;

drop table if exists crosswalk;
create table crosswalk (
level_2 varchar(50),
detaw varchar(50),
abbrev varchar(2),
detaw_num integer);
\COPY xwalk from xwalk.csv with csv header


drop table if exists size;
create table size (
subarea integer,
year integer,
type char,
c1 integer,
c2 integer,
c3 integer,
c4 integer,
c5 integer,
c6 integer,
c7 integer,
c8 integer,
c9 integer,
c10 integer,
c11 integer,
c12 integer,
c13 integer,
c14 integer,
c15 integer);

create view total_size as
select subarea,c1+c2+c3+c4+c5+c6+c7+c8+c9+c10+c11+c12+c13+c14+c15 as area
from size;

\COPY size from size.csv with csv header

drop table if exists etc;
create table etc (
subarea integer,
doy integer,
ymd date,
"time" time,
c1 float,
c10 float,
c11 float,
c12 float,
c13 float,
c14 float,
c15 float,
c2 float,
c3 float,
c4 float,
c5 float,
c6 float,
c7 float,
c8 float,
c9 float);

\COPY etc from etc.csv with csv header

drop table if exists eto;
create table eto as select * from etc limit 0;

\COPY eto from eto.csv with csv header

create materialized view model_output as
select subarea,ymd,
?::integer as crop_num,
c.c?*304.8/(s.c?*2.47) as et,
c.e?*304.8/(s.c?*2.47) as et0,
(c.c?/e.c?)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c?>0
union
select subarea,ymd,
?::integer as crop_num,
c.c?*304.8/(s.c?*2.47) as et,
c.e?*304.8/(s.c?*2.47) as et0,
(c.c?/e.c?)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c?>0
union
select subarea,ymd,
?::integer as crop_num,
c.c?*304.8/(s.c?*2.47) as et,
c.e?*304.8/(s.c?*2.47) as et0,
(c.c?/e.c?)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c?>0
union
select subarea,ymd,
?::integer as crop_num,
c.c?*304.8/(s.c?*2.47) as et,
c.e?*304.8/(s.c?*2.47) as et0,
(c.c?/e.c?)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c?>0
union
select subarea,ymd,
?::integer as crop_num,
c.c?*304.8/(s.c?*2.47) as et,
c.e?*304.8/(s.c?*2.47) as et0,
(c.c?/e.c?)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c?>0
union
select subarea,ymd,
?::integer as crop_num,
c.c?*304.8/(s.c?*2.47) as et,
c.e?*304.8/(s.c?*2.47) as et0,
(c.c?/e.c?)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c?>0
union
select subarea,ymd,
?::integer as crop_num,
c.c?*304.8/(s.c?*2.47) as et,
c.e?*304.8/(s.c?*2.47) as et0,
(c.c?/e.c?)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c?>0
union
select subarea,ymd,
?::integer as crop_num,
c.c?*304.8/(s.c?*2.47) as et,
c.e?*304.8/(s.c?*2.47) as et0,
(c.c?/e.c?)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c?>0
union
select subarea,ymd,
?::integer as crop_num,
c.c?*304.8/(s.c?*2.47) as et,
c.e?*304.8/(s.c?*2.47) as et0,
(c.c?/e.c?)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c?>0
union
select subarea,ymd,
?::integer as crop_num,
c.c?*304.8/(s.c?*2.47) as et,
c.e?*304.8/(s.c?*2.47) as et0,
(c.c?/e.c?)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c?>0
union
select subarea,ymd,
?::integer as crop_num,
c.c?*304.8/(s.c?*2.47) as et,
c.e?*304.8/(s.c?*2.47) as et0,
(c.c?/e.c?)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c?>0
union
select subarea,ymd,
?::integer as crop_num,
c.c?*304.8/(s.c?*2.47) as et,
c.e?*304.8/(s.c?*2.47) as et0,
(c.c?/e.c?)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c?>0
union
select subarea,ymd,
?::integer as crop_num,
c.c?*304.8/(s.c?*2.47) as et,
c.e?*304.8/(s.c?*2.47) as et0,
(c.c?/e.c?)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c?>0
union
select subarea,ymd,
?::integer as crop_num,
c.c?*304.8/(s.c?*2.47) as et,
c.e?*304.8/(s.c?*2.47) as et0,
(c.c?/e.c?)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c?>0
union
select subarea,ymd,
?::integer as crop_num,
c.c?*304.8/(s.c?*2.47) as et,
c.e?*304.8/(s.c?*2.47) as et0,
(c.c?/e.c?)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c?>0;


