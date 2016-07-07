create table model_output (
dauco varchar(5),
commodity text,
year integer,
mon integer,
day integer,
doy integer,
area float,
oKc float,
iKc float,
ccKc float,
ETo float,
Kc float,
ETc float,
PCP float,
Er float,
Spg float,
Espg float,
SWD float,
SWDx float,
FC float,
PWP float,
SWC float,
YT float,
NA float,
primary key (dauco,commodity,year,mon,day)
);

\COPY model_output from model_output.csv with csv header
