set search_path=detaw,public;

create materialized view model_output as
select subarea,ymd,
1::integer as detaw_num,
c.c1*304.8/(s.c1*2.47) as et,
e.c1*304.8/(s.c1*2.47) as et0,
(c.c1/e.c1)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c1>0
union
select subarea,ymd,
2::integer as detaw_num,
c.c2*304.8/(s.c2*2.47) as et,
e.c2*304.8/(s.c2*2.47) as et0,
(c.c2/e.c2)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c2>0
union
select subarea,ymd,
3::integer as detaw_num,
c.c3*304.8/(s.c3*2.47) as et,
e.c3*304.8/(s.c3*2.47) as et0,
(c.c3/e.c3)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c3>0
union
select subarea,ymd,
4::integer as detaw_num,
c.c4*304.8/(s.c4*2.47) as et,
e.c4*304.8/(s.c4*2.47) as et0,
(c.c4/e.c4)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c4>0
union
select subarea,ymd,
5::integer as detaw_num,
c.c5*304.8/(s.c5*2.47) as et,
e.c5*304.8/(s.c5*2.47) as et0,
(c.c5/e.c5)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c5>0
union
select subarea,ymd,
6::integer as detaw_num,
c.c6*304.8/(s.c6*2.47) as et,
e.c6*304.8/(s.c6*2.47) as et0,
(c.c6/e.c6)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c6>0
union
select subarea,ymd,
7::integer as detaw_num,
c.c7*304.8/(s.c7*2.47) as et,
e.c7*304.8/(s.c7*2.47) as et0,
(c.c7/e.c7)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c7>0
union
select subarea,ymd,
8::integer as detaw_num,
c.c8*304.8/(s.c8*2.47) as et,
e.c8*304.8/(s.c8*2.47) as et0,
(c.c8/e.c8)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c8>0
union
select subarea,ymd,
9::integer as detaw_num,
c.c9*304.8/(s.c9*2.47) as et,
e.c9*304.8/(s.c9*2.47) as et0,
(c.c9/e.c9)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c9>0
union
select subarea,ymd,
10::integer as detaw_num,
c.c10*304.8/(s.c10*2.47) as et,
e.c10*304.8/(s.c10*2.47) as et0,
(c.c10/e.c10)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c10>0
union
select subarea,ymd,
11::integer as detaw_num,
c.c11*304.8/(s.c11*2.47) as et,
e.c11*304.8/(s.c11*2.47) as et0,
(c.c11/e.c11)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c11>0
union
select subarea,ymd,
12::integer as detaw_num,
c.c12*304.8/(s.c12*2.47) as et,
e.c12*304.8/(s.c12*2.47) as et0,
(c.c12/e.c12)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c12>0
union
select subarea,ymd,
13::integer as detaw_num,
c.c13*304.8/(s.c13*2.47) as et,
e.c13*304.8/(s.c13*2.47) as et0,
(c.c13/e.c13)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c13>0
union
select subarea,ymd,
14::integer as detaw_num,
c.c14*304.8/(s.c14*2.47) as et,
e.c14*304.8/(s.c14*2.47) as et0,
(c.c14/e.c14)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c14>0
union
select subarea,ymd,
15::integer as detaw_num,
c.c15*304.8/(s.c15*2.47) as et,
e.c15*304.8/(s.c15*2.47) as et0,
(c.c15/e.c15)::decimal(6,4) as kc
from detaw.etc c
join detaw.eto e
using (subarea,ymd)
join size s using (subarea)
where c.c15>0;


