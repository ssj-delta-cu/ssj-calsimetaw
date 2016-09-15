# ssj-detaw
Application of the DETAW calculation of ET, using supplied ETc and ETo daily values 
for each DeTAW sub-region

Lead: Tariq Kadir

This method provides estimations of ET based on the DeTAW model which within the Bay Delta Service Area.  The DeTAW model supplies daily estimates of ET and ET for each of 163 sub-areas within the delta service region.

The DeTAW estimates are prescriptive.  That means primarily that ET is estimated by predicting what each crop category would require rather than measure that directly.  Expected ET for each crop type are calibrated to expected Kc values that have been derived from satellite estimates using the SeBAL method.

## Methodology

DeTAW provides daily ET estimations for the Delta Service Region in California.  The Service region is divided into 163 regions.  Each daily DeTAW ET measurement is provided at the sub-area level.

Within each sub-area DeTAW as ET and ETo estimations for each of the DWR crop categories.  Each sub-area also has estimates of the total area for each crop category.

In order to provide comparisons of the DeTAW product with the other ET estimations in this project, DeTAW estimations need to be combined with higher resolution data to provide the ET estimates.   This includes Spatial CIMIS for estimations of ETo, and a landcover map to determine where the crop categories reside.  

The process is: 

* Export DeTAW output dss data as CSV files.
* Import CSV files into a database for daily ET and ETo estimations for each crop category over each 
* Estimate daily DeTAW Kc values with spatial CIMIS ETo to obtain estimated daily ET=Kc*ETo for every sub-area, crop category and Spatial CIMIS pixel.
* Aggregate Daily ET into monthly values, (average ET for each month)
* Intersect Aggregated ET with Landuse type, to apply the appropriate commodity to each high resolution field/region.  The result has each field assigned the average ET for each month
* Export this as a 30m raster of 12 bands, each band representing the monthly average ET.  These can then be directly compared to the directly measured ET based methods.

| Estimated Yearly ET | July Raster ET 
| --- | ---
| ![Yearly ET][et] | ![July Raster][jul]

[jul]:july.png
[aug]:raster.png
[et]:detaw.png

### Export DSS Data / Import into Database

DeTAW output data comes in a set of DSS files.  In order to use these
data, a certain set of data are extracted from these files.  This is
down by extracting into CSV, the ETc and ETo entries from all the
files delivered to UCD.  These were then manipulated into a more
standard set of inputs for a Postgres table for both etc and eto.

### Estimate Kc / ET for 30M pixels

The following steps are used to create the high resolution images from
the DeTAW data.  First, the Spatial CIMIS ETo data for Water Year
21015 (wy2105), are imported.  Each sub-area is then intersected with
each cimis pixel. These are the individual Kc regions.

We then create a view, _model_output_ that divides ET by ETo for every
sub-area,crop and date.  This gives us a Kc for every sub-area

We then sum _model_output_ Kc * ETo for each sub-area pixel
intersection, over each month to get an ET estimate for every
pixel/sub-area combination.  We have these for every crop type as well.

Then, for each pixel in the 30m region, we determine which
pixel/sub-area it is in, and then associate the ET for the specified
crop type for each region.

Note, unlike CalSIMETAW were we could calculate non-precipitation
events.  We cannot do the same with DeTAW, since we have no
independant Kc estimate to use in that case.


## [Results](./results)

ETo is taken directly from the [Weather Repository].

### LandIQ Based

Data | Description | Monthly
---  | --- | ---
ET   | Average Monthly ET | [results/wy2015/monthly]

[results/wy2015/monthly]: ./results/nasa/wy2015/monthly
[LandIQ Landuse]: https://github.com/ssj-delta-cu/ssj-landuse

DWR has contracted to produce the [LandIQ Landuse] dataset.  This dataset
provides a *Level_1* classification that is nearly identical to the DeTAW crop categories. 
We used these polygons to calculate prescriptive ET at the field scale.  

 detaw_num | abbrev |       detaw       |               level_2                
 --------- | ------ | ----------------- | -------------------------------------
         1 | UR     | Urban             | Urban
         2 | PA     | Pasture           | Pasture
         2 | PA     | Pasture           | Turf
         3 | AL     | Alfalfa           | Alfalfa
         4 | FI     | Field             | Sunflower
         4 | FI     | Field             | Corn
         4 | FI     | Field             | Safflower
         6 | GR     | Grain             | Forage Grass
         7 | RI     | Rice              | Rice
         8 | TR     | Truck             | Cucurbit
         8 | TR     | Truck             | Bush Berries
         8 | TR     | Truck             | Potatoes
         8 | TR     | Truck             | Truck Crops
         9 | TO     | Tomato            | Tomatoes
        10 | OR     | Orchards          | Pears
        10 | OR     | Orchards          | Almonds
        10 | OR     | Orchards          | Cherries
        10 | OR     | Orchards          | Citrus
        10 | OR     | Orchards          | Olives
        10 | OR     | Orchards          | Other Deciduous
        10 | OR     | Orchards          | Pistachios
        10 | OR     | Orchards          | Walnuts
        11 | VI     | Vineyards         | Vineyards
        12 | NR     | Native Riparian   | Riparian
        13 | NV     | Native Vegetation | Semi-agricultural/ROW
        13 | NV     | Native Vegetation | Fallow
        13 | NV     | Native Vegetation | Wet herbaceous/sub irrigated pasture
        13 | NV     | Native Vegetation | Upland Herbaceous
        15 | WS     | Water             | Floating Vegetation
        15 | WS     | Water             | Water
