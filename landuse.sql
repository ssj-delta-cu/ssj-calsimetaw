-- These scripts provide the landuse informaiton for Cal-SIMETAW (that is by DAUCo)
-- Needed to run the CalSIMETAW program.  We include both CDL and LandIQ landuse data.

-- creates a geom colummn for the DAU table that was imported from the geojson and validates the geometry
ALTER TABLE calsimetaw.dau ADD COLUMN geom geometry(Geometry, 3310);
UPDATE calsimetaw.dau
SET geom=ST_MakeValid (wkb_geometry);

-- creates a geom colummn for the counties table imported from the geojson file and validates the geometry
ALTER TABLE calsimetaw.counties ADD COLUMN geom geometry(Geometry, 3310);
UPDATE calsimetaw.counties
SET geom=ST_MakeValid (wkb_geometry);


-- First we create the dauco map.  This should probably be added to the dua project since we use it so much.
create table calsimetaw.dauco as select 
replace(format('DAUCo%s%2sGA',dau_code,ansi::integer/2+1),' ','0') as label,
replace(format('%s%2s',dau_code,ansi::integer/2+1),' ','0') as dauco,
dau_code,ansi,st_intersection(d.geom,c.geom) as geom 
from calsimetaw.dau d join calsimetaw.counties c on (st_intersects(d.geom,c.geom) and st_area(st_intersection(d.geom,c.geom))>1) 
where dau_code in ('185','186') order by 1,3;

create materialized view calsimetaw.dau_landuse_wy2015 as 
select 
level_1,level_2,dauco,
sum(st_area(st_intersection(d.geom,l.geom))) 
from calsimetaw.dauco d join landuse_2015 l on (st_intersects(d.geom,l.geom))
group by 1,2,3;

create materialized view calsimetaw.dau_landuse_wy2016 as 
select 
level_2,dauco,
sum(st_area(st_intersection(d.geom,l.geom))) 
from calsimetaw.dauco d join landuse_2016 l on (st_intersects(d.geom,l.geom))
group by 1,2;


create or replace view level_1_ct_wy2015 as 
select * from crosstab(
    'select level_1,dauco,sum(sum)::integer from calsimetaw.dau_landuse_wy2015 group by 1,2 order by 1,2',
    'select distinct dauco from calsimetaw.dau_landuse_wy2015 order by 1'
) as ( 
    level_1 text,
    "DAUCo18501GA" integer,
    "DAUCo18507GA" integer,
    "DAUCo18539GA" integer,
    "DAUCo18634GA" integer,
    "DAUCo18648GA" integer,
    "DAUCo18657GA" integer
);

create or replace view level_2_ct_wy2015 as 
select * from crosstab(
    'select level_2,dauco,sum(sum)::integer from calsimetaw.dau_landuse_wy2015 group by 1,2 order by 1,2',
    'select distinct dauco from calsimetaw.dau_landuse_wy2015 order by 1'
) as ( 
    level_2 text,
    "DAUCo18501GA" integer,
    "DAUCo18507GA" integer,
    "DAUCo18539GA" integer,
    "DAUCo18634GA" integer,
    "DAUCo18648GA" integer,
    "DAUCo18657GA" integer
);

create or replace view level_2_ct_wy2016 as 
select * from crosstab(
    'select level_2,dauco,sum(sum)::integer from calsimetaw.dau_landuse_wy2016 group by 1,2 order by 1,2',
    'select distinct dauco from calsimetaw.dau_landuse_wy2016 order by 1'
) as ( 
    level_2 text,
    "DAUCo18501GA" integer,
    "DAUCo18507GA" integer,
    "DAUCo18539GA" integer,
    "DAUCo18634GA" integer,
    "DAUCo18648GA" integer,
    "DAUCo18657GA" integer
);

-- Fixup the model_output for fallow?
insert into calsimetaw.model_output_wy2015
(dauco,commodity,year,mon,day,doy,okc,ikc,kc)
select
dauco,
'Fallow' as commodity,
year,mon,day,doy,
min(okc) as okc,
0 as ikc,
min(okc) as kc
from calsimetaw.model_output_wy2015
group by dauco,year,mon,day,doy
order by dauco,doy;

create table calsimetaw.crosswalk as
select * from
(VALUES
('Alfalfa','Alfalfa'),
('Almonds','Almonds'),
('Cherries','Cherries'),
('CitrusSubtrop','Citrus'),
('Corn','Corn'),
('Cucurbits','Cucurbit'),
('Fallow','Fallow'),
('Fallow', 'Summer Fallow'),
('Fallow','Upland Herbaceous'),
('Pasture','Wet herbaceous/sub irrigated pasture'),
('Olives','Olives'),
('OtherDeciduous','Other Deciduous'),
('Pasture','Pasture'),
('Pasture','Forage Grass'),
('Turffarm','Turf'),
('Pears','Pears'),
('Pistachio','Pistachios'),
('Potatoes','Potatoes'),
('Rice','Rice'),
('Riparian','Riparian'),
('Riparian','Floating Vegetation'),
('Safflower','Safflower'),
('OtherDeciduous','Semi-agricultural/ROW'),
('Sunflower','Sunflower'),
('Tomato','Tomatoes'),
('TruckCrops','Truck Crops'),
('Bushberries','Bush Berries'),
('UrbanLandscape','Urban'),
('Vineyard','Vineyards'),
('Walnuts','Walnuts'),
('WaterSurface','Water')
) as X(commodity,level_2);
