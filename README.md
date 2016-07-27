# ssj-calsimetaw
Application of the Prescriptive CalSIMETAW / CUPS inspired calculation of
ET, using Kc tables and ETo.

Lead: Quinn Hart, Morteza Orang, Tariq Kadir

This method provides estimations of ET based on DWR's published Kc (Crop coefficient) curves for the various crops grown within the Bay Delta Service Area.  CalSIMETAW is a more complete water balance model.  In effort we are only including the ET calculation portion.  This includes soil evaporation and plant evapotranspiration.   Extensive information on ET calculation, including model formulation can be found in the [Cups Users' Guide].

Unlike most other ET estimations, the CalSIMETAW estimates are prescriptive.  That means primarily that ET is estimated by predicting what each crop category would require rather than measure that directly.  This means the raster maps of ET estimations are based on measured reference Evapotranspiration (ETo), combined with crop category maps.

## Methodology

The CalSIMETAW program provides daily ET estimations for regions in California.  The CalSIMETAW model is designed primarily for regional planning and uses regions based on DWR's Detailed Analysis units and counties, known as DAUCOs. For the Delta, there are 6 DAUCOs.

Within each region, CalSIMETAW has estimates of Kc values for each of the DWR crop categories.  These values are supplied daily.  Each region also has estimates of the total area for each category for each DAUCO.

In order to provide comparisons of the CalSIMETAW product with the other ET estimations in this project, the CalSIMETAW estimations need to be combined with higher resolution data to provide the ET estimates.   This includes Spatial CIMIS for estimations of ETo, and a landcover map, to determine where the crop categories reside.  

The process is: 

* Import CalSIMETAW Daily data for each commodity and dauco
* Intersect CalSIMTAW Kc values with spatial CIMIS ETo to have estimated daily ET=Kc*ETo for every DAUCO, commodity and Spatial CIMIS pixel.
* Aggregate Daily ET into monthly values, (average ET for each month)
* Intersect Aggregated ET with Landuse type, to apply the appropriate commodity to each high resolution field/region.  The results has each field assigned it's average ET for each month
* Export this as a 30m raster of 12 bands, each band representing the monthly average ET.  These can then be directly compared to the directly measured ET based methods.

| Estimated Yearly ET | August Raster ET 
| --- | ---
| ![Yearly ET][et] | ![August Raster][aug]

[aug]:raster.png

## [Results](./results)

We calculate our ET results in a few ways.   Regardless of the method however, the output will be the same, the method provides monthy estimates of ET based on Spatial CIMIS ETo, CalSIMETAW ppt and the Kc curves supplied by DWR's CalSIMETAW program.

One important component of CalSIMETAW is that it modifies it's Kc and ET based on precipication events that wet the surface.  We will also include monthly predictions of ET, that do not include this contribution.  This can be done using CalSIMETAW's iKc term.  This allows for 

ETo is taken directly from the [Weather Repository].  The CalSIMETAW DAUCOs include precipitation events.  

### LandIQ Based

Data | Descriptionn | Monthly
---  | --- | ---
ET   | Average Monthly ET | [results/wy2015/monthly]
iET   | Average Monthly Crop (no PPT) ET | [results/wy2015/monthly]

[results/wy2015/monthly]: ./results/nasa/wy2015/monthly
[LandIQ Landuse]: https://github.com/ssj-delta-cu/ssj-landuse

DWR has contracted to produce the [LandIQ Landuse] dataset.  This dataset
provides a *Level_2* classification that is nearly identical to the CalSIMETAW crop categories. 
We used these polygons to calculate prescriptive ET at the field scale.  

commodity | level_2 | commodity | level_2
--- | --- | --- | ---
Alfalfa   | Alfalfa  |     Pistachio | Pistachios
Almonds   | Almonds  |        Potatoes  | Potatoes
Cherries  | Cherries |        Rice      | Rice
CitrusSubtrop  | Citrus |        Riparian  | Riparian
Corn      | Corn  |        Riparian  | Floating Vegetation
Cucurbits | Cucurbit |        Safflower | Safflower
FALLOW    | Fallow |        OtherDeciduous | Semi-agricultural/ROW
FALLOW    | Upland Herbaceous |      Sunflower | Sunflower
Pasture   | Wet herbaceous/sub irrigated pasture |  Tomato    | Tomatoes
Olives    | Olives       |   TruckCrops     | Truck Crops
OtherDeciduous | Other Deciduous     |  Bushberries    | Bush Berries
Pasture   | Pasture       |  UrbanLandscape | Urban
Pasture   | Forage Grass      |  Vineyard  | Vineyards
Turffarm  | Turf        |  Walnuts   | Walnuts
Pears     | Pears        |  WaterSurface   | Water

## Alternative Vegetation

We could test the regional sensitivity of the CalSIMETAW method by comparing the results from a number of alternative landuse types.  Two additional Land-cover types are available.

### NASA Landcover Based

NASA has provided the SSJ team with a vector data layer of landcover that includes [Cropland Data Layer] (CDL) crop types.  We will use this vector map to calculate ET.  For this effort, we will use vector processing of for the calculation.  We will also use the larger CalSIMETAW 4km grid for weather inputs.

Data | Daily | Monthly
---  | --- | ---
ET   | [results/nasa/wy2015/daily] | [results/nasa/wy2015/monthly]
Kc   | [results/nasa/wy2015/daily] | [results/nasa/wy2015/monthly]


[NASA Landcover]: https://github.com/ssj-delta-cu/ssj-nasa-landcover
[results/nasa/wy2015/daily]: ./results/nasa/wy2015/daily
[results/nasa/wy2015/monthly]: ./results/nasa/wy2015/monthly

### CDL Landcover Based

The USDA [Cropland Data Layer] is a 30m raster based crop data type.  Unlike the NASA product, the methodology does not try to make uniform fields, but estimates each pixel seperately.  The data is provided in a raster form.  For this method, we utilized Google's Earth Engine Platform, as a test of it's utility.

Data | Daily | Monthly
---  | --- | ---
ET   | [results/cdl/wy2015/daily] | [results/cdl/wy2015/monthly]
Kc   | [results/cdl/wy2015/daily] | [results/cdl/wy2015/monthly]

[results/cdl/wy2015/daily]: ./results/cdl/wy2015//daily
[results/cdl/wy2015/monthly]: ./results/cdl/wy2015//monthly

[Cropland Data Layer]: http://www.nass.usda.gov/Research_and_Science/Cropland/SARS1a.php

[CUPS Users' Guide]: ./documentation/cups.pdf
[Weather Repository]: https://github.com/ssj-delta-cu/ssj-weather/cimis
[dauco]: dauco.png
[et]: et.png
