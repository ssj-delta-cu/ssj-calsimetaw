# ssj-calsimetaw
Application of the Prescriptive CalSIMETAW / CUPS inspired calculation of
ET, using Kc tables and ETo.

Lead: Quinn Hart, Morteza Orang, Tariq Kadir

This method provides estimations of ET based on DWR's published Kc (Crop coefficient) curves for the various crops grown within the Bay Delta Service Area.  CalSIMETAW is a more complete water balance model.  In effort we are only including the ET calculation portion.  This includes soil evaporation and plant evapotranspiration.   Extensive information on ET calculation, including model formulation can be found in the [Cups Users' Guide].

Unlike most other ET estimations, the CalSIMETAW estimates are prescriptive.  That means primarily that ET is estimated by predicting what each crop category would require rather than measure that directly.  This means the raster maps of ET estimations are based on measured reference Evapotranspiration (ETo), combined with crop category maps.

## Methodology

The CalSIMETAW program provides daily ET estimations for regions in California.  The CalSIMETAW model is designed primarily for regional planning and uses regions based on DWR's Detailed Analysis units and counties, known as DAUCOs. For the Delta, there are 6 DAUCOs.

Within each region, CalSIMETAW has estimates of Kc values for each of the DWR crop categories.  These values are supplied daily.  Each region also has estimates of the total area for each category for each DAUCO.

CalSIMETAW provides daily Kc estimations for each crop categorie within each DAUCO.   In order to provide comparisons of the CalSIMETAW product with the other ET estimations in this project, the CalSIMETAW estimations need to be combined with higher resolution data to provide higher resolution ET estimates.   This includes Spatial CIMIS for estimations of ETo, and a landcover map, to determein


## [Results](./results)

We calculate ET in a few ways.   Regardless of the method however, the outputs and intermediate products will be the same, the method provides monthy estimates of ET and Kc based on Spatial CIMIS ETo, CalSIMETAW ppt and the Kc curves supplied by DWR's CalSIMETAW program.

Because CalSIMETAW includes ET from precipication events, we will calculate monthly ET 

ETo is taken directly from the [Weather Repository].  The CalSIMETAW DAUCOs include precipitation events.  

### LandIQ Based

DWR has contracted to produce the [LandIQ Landuse] dataset.  This dataset
provides a *Level_2* classification that is nearly identical to the CalSIMETAW crop categories. We will use this vector layer to calculate prescriptive ET at the field scale.  For this effort, we will use vector processing of for the calculation. 



Data | Monthly
---  | ---
ET   | [results/nasa/wy2015/monthly]
Kc   | [results/nasa/wy2015/monthly]

To create the required 30m raster map, the resultant outputs where rasterized and exported.

[results/wy2015/monthly]: ./results/nasa/wy2015/monthly
[LandIQ Landuse]: https://github.com/ssj-delta-cu/ssj-landuse

### NASA Landcover Based

NASA has provided the SSJ team with a vector data layer of landcover that includes [Cropland Data Layer] (CDL) crop types.  We will use this vector map to calculate ET.  For this effort, we will use vector processing of for the calculation.  We will also use the larger CalSIMETAW 4km grid for weather inputs.

Data | Daily | Monthly
---  | --- | ---
ET   | [results/nasa/wy2015/daily] | [results/nasa/wy2015/monthly]
Kc   | [results/nasa/wy2015/daily] | [results/nasa/wy2015/monthly]

To create the summarization tables, the vector maps were intersected with the [Island Regions].

To create the required 30m raster map, the resultant outputs where rasterized and exported.

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

