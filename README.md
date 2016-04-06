# ssj-calsimetaw
Application of the CalSIMETAW / CUPS inspired calculation of
ET, using Kc tables and ETo.

Lead: Quinn Hart, Morteza Orang, Tariq Kadir

This method provides estimations of ET based on DWR's published Kc (Crop coefficient) curves for the various crops grown within the Bay Delta Service Area.  CalSIMETAW is a more complete water balance model.  In effort we are only including the ET calculation portion.  This includes soil evaporation and plant evapotranspiration.  

Extensive information, including model formulation can be found in the [Cups Users' Guide].

## [Results](./results)

We will investigate a number of different methods for calculating ET, differing primarily in the landcover model used, but also in the workflow for calculation of the model.  Regardless of the method however, the outputs and intermediate products will be the same.

This method will provide daily estimates of ET and Kc based on Spatial CIMIS ETo, CalSIMETAW ppt and the Kc curves supplied by DWR.

ETo and Precipitation (ppt) are taken directly from the [Weather Repository]

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
