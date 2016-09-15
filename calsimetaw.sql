drop schema weather cascade;
create schema weather;

create table weather.psychrometric_constant (
east integer,
north integer,
pc float
);
\COPY weather.psychrometric_constant from psychrometric_constant.csv with csv header

create table weather.calsimetaw (
dwr_id varchar(7),
x integer,
y integer,
ymd date,
year integer,
month integer,
day integer,
doy integer,
eto float,
tx float,
tn float,
rs float,
k float ,
u2 float,
tdew float,
pcp float
);


--(900 * psychrometric_constant@2km / (Tm + 273) * U2 * (es - ea) +  0.408 * (4098.17 * 0.6108 * exp(Tm * 17.27 / (Tm + 237.3)) / (Tm + 237.3) ^ 2) * (Rs * (1 - 0.23) + Rnl)) / (4098.17 * 0.6108 * exp(Tm * 17.27 / (Tm + 237.3)) / (Tm + 237.3) ^ 2 + psychrometric_constant@2km * (1 + 0.34 * U2))
