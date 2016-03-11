dwr ={
 0:{code:"UNK",name:'Unknown',BCDp:[7,30,100],Kc:[0,0,0],plant:[1,1],harvest:[12,31]},
 1:{code:"GR",name:"Grain",BCDp:[20,45,75],Kc:[0.33,1.1,0.15],plant:[3,1],harvest:[8,31]},
 2:{code:"RI",name:"Rice",BCDp:[24,37,86],Kc:[1.2,1.05,0.8],plant:[3,1],harvest:[10,15]},
 3:{code:"CO",name:"Cotton",BCDp:[15,25,85],Kc:[0.35,0.95,0.5],plant:[4,1],harvest:[12,27]},
 4:{code:"SB",name:"Sugar beet",BCDp:[15,45,80],Kc:[0.2,1.15,0.95],plant:[1,1],harvest:[12,31]},
 5:{code:"CN",name:"Corn",BCDp:[20,45,100],Kc:[0.2,1,1],plant:[3,15],harvest:[9,30]},
 6:{code:"DB",name:"Dry beans",BCDp:[24,40,91],Kc:[0.2,1,0.1],plant:[5,15],harvest:[9,15]},
 7:{code:"SA",name:"Safflower",BCDp:[17,45,80],Kc:[0.2,1.05,0.25],plant:[4,1],harvest:[10,15]},
 8:{code:"FL",name:"Other field crops",BCDp:[16,42,75],Kc:[0.2,1.05,0.5],plant:[1,1],harvest:[12,31]},
 9:{code:"AL",name:"Alfalfa",BCDp:[25,50,75],Kc:[1,1,1],plant:[1,1],harvest:[12,31]},
 10:{code:"PA",name:"Pasture",BCDp:[25,50,75],Kc:[0.95,0.95,0.95],plant:[1,1],harvest:[12,31]},
 11:{code:"TP",name:"Tomato processing",BCDp:[25,50,80],Kc:[0.3,1.1,0.65],plant:[4,1],harvest:[8,31]},
 12:{code:"TF",name:"Tomato fresh",BCDp:[25,50,80],Kc:[0.3,1.1,0.65],plant:[4,1],harvest:[8,31]},
 13:{code:"CU",name:"Cucurbits",BCDp:[21,50,83],Kc:[0.8,0.95,0.75],plant:[1,1],harvest:[12,31]},
 14:{code:"OG",name:"Onion & garlic",BCDp:[25,70,90],Kc:[0.55,1.2,0.55],plant:[4,1],harvest:[11,1]},
 15:{code:"PO",name:"Potatoes",BCDp:[20,45,78],Kc:[0.8,1.1,0.7],plant:[4,1],harvest:[10,15]},
 16:{code:"TR",name:"Truck_Crops_misc",BCDp:[25,65,90],Kc:[0.8,0.8,0.8],plant:[1,1],harvest:[12,31]},
 17:{code:"AP",name:"Almond & pistacios",BCDp:[0,50,90],Kc:[0.55,1.15,0.65],plant:[3,1],harvest:[10,15]},
 18:{code:"OR",name:"Orchard (deciduous)",BCDp:[0,50,90],Kc:[0.55,1.15,0.65],plant:[3,1],harvest:[10,15]},
 19:{code:"CS",name:"Citrus & subtropical",BCDp:[0,33,67],Kc:[1,1,1],plant:[1,1],harvest:[12,31]},
 20:{code:"VI",name:"Vineyards",BCDp:[0,25,75],Kc:[0.45,1.05,0.35],plant:[4,1],harvest:[11,1]},
 21:{code:"UR",name:"Urban landscape",BCDp:[25,50,75],Kc:[0.1,0.1,0.1],plant:[1,1],harvest:[12,31]},
 22:{code:"RV",name:"Riparian",BCDp:[25,50,75],Kc:[0.5,0.5,0.5],plant:[1,1],harvest:[12,31]},
 23:{code:"NV",name:"Native vegetation",BCDp:[25,50.75],Kc:[0.3,0.3,0.3],plant:[1,1],harvest:[12,31]},
 24:{code:"WS",name:"Water surface",BCDp:[25,50,75],Kc:[1,1,1],plant:[1,1],harvest:[12,31]},
 99:{code:"SOIL",name:"Soil",BCDp:[25,50,75],Kc:[0,0,0],plant:[1,1],harvest:[12,31]}

 var dau= {
   185:{
     1:{BCDp[18,39,77],KC:[0.32,1.05,0.25],plant:[11,1],harvest:[5,15]},
     2:{BCDp[18,24,78],KC:[1.1,1,0.6],plant:[5,1],harvest:[9,22]},
     3:{BCDp[15,25,85],KC:[0.35,0.95,0.5],plant:[5,20],harvest:[10,30]},
     4:{BCDp[15,45,80],KC:[0.2,1.15,0.95],plant:[3,10],harvest:[9,30]},
     5:{BCDp[20,45,86],KC:[0.2,1.03,0.78],plant:[5,1],harvest:[9,30]},
     6:{BCDp[24,40,91],KC:[0.2,1,0.1],plant:[5,1],harvest:[8,31]},
     7:{BCDp[17,45,80],KC:[0.2,1.05,0.25],plant:[5,17],harvest:[8,31]},
     8:{BCDp[16,44,79],KC:[0.35,1.1,0.6],plant:[4,1],harvest:[9,17]},
     9:{BCDp[25,50,75],KC:[1,1,1],plant:[10,1],harvest:[9,30]},
     10:{BCDp[25,50,75],KC:[0.95,0.95,0.95],plant:[10,1],harvest:[9,30]},
     11:{BCDp[25,50,80],KC:[0.3,1.1,0.65],plant:[4,1],harvest:[8,31]},
     12:{BCDp[25,50,80],KC:[0.2,1.1,1],plant:[4,15],harvest:[7,31]},
     13:{BCDp[20,49,79],KC:[0.8,0.94,0.79],plant:[3,10],harvest:[7,21]},
     14:{BCDp[10,27,73],KC:[0.55,1.2,0.55],plant:[9,15],harvest:[5,31]},
     15:{BCDp[20,45,78],KC:[0.8,1.1,0.7],plant:[4,15],harvest:[8,22]},
     16:{BCDp[14,29,93],KC:[0.3,1.01,0.35],plant:[10,1],harvest:[9,30]},
     17:{BCDp[0,50,90],KC:[0.55,1.15,0.65],plant:[2,11],harvest:[10,31]},
     18:{BCDp[0,46,78],KC:[0.55,1.12,0.8],plant:[3,3],harvest:[10,31]},
     19:{BCDp[0,33,67],KC:[0.7,0.7,0.7],plant:[10,1],harvest:[9,30]},
     20:{BCDp[0,25,75],KC:[0.45,0.8,0.35],plant:[4,1],harvest:[11,15]},
     21:{BCDp[25,50,75],KC:[0.8,0.8,0.8],plant:[1,1],harvest:[12,31]},
     22:{BCDp[25,50,75],KC:[0.8,1.1,0.8],plant:[1,1],harvest:[12,31]},
     23:{BCDp[25,50,75],KC:[1,0.4,1],plant:[1,1],harvest:[12,31]},
     24:{BCDp[25,50,75],KC:[1.2,1.2,1.2],plant:[1,1],harvest:[12,31]},
   }
 };


var Crops = {
  '1.01':{name:'Alfalfa (cycle)',BCDp:[7,30,100],Kc:[0.4,1.15,0.4],plant:[11,1],harvest:[5,31]},
  '1.02':{name:'Artichokes',BCDp:[6,19,90],Kc:[0.65,0.65,0.65],plant:[3,1],harvest:[10,1]},
  '1.03':{name:'Asparagus',BCDp:[12,25,95],Kc:[0.25,1,0.25],plant:[3,1],harvest:[8,1]},
  '1.04':{name:'Barley',BCDp:[20,45,75],Kc:[0.7,1.1,0.15],plant:[3,1],harvest:[5,31]},
  '1.05':{name:'Beans (pinto)',BCDp:[24,40,91],Kc:[0.2,0.9,0.1],plant:[4,25],harvest:[7,25]},
  '1.06':{name:'Beans (dry)',BCDp:[24,40,91],Kc:[0.2,1,0.1],plant:[5,15],harvest:[9,15]},
  '1.07':{name:'Beans (green)',BCDp:[22,56,89],Kc:[0.8,1,0.85],plant:[4,1],harvest:[5,1]},
  '1.08':{name:'Beets (early)',BCDp:[25,60,90],Kc:[0.3,0.9,0.9],plant:[4,15],harvest:[8,15]},
  '1.09':{name:'Beets (late)',BCDp:[25,60,90],Kc:[0.3,0.9,0.9],plant:[4,1],harvest:[7,31]},
  '1.1':{name:'Broccoli',BCDp:[20,50,83],Kc:[0.3,1,0.8],plant:[4,1],harvest:[7,31]},
  '1.11':{name:'Cabbage',BCDp:[25,63,88],Kc:[0.3,1,0.85],plant:[4,1],harvest:[11,15]},
  '1.12':{name:'Carrots',BCDp:[20,50,83],Kc:[0.85,0.95,0.8],plant:[11,15],harvest:[1,31]},
  '1.13':{name:'Celery',BCDp:[15,40,90],Kc:[0.8,0.95,0.95],plant:[1,15],harvest:[4,15]},
  '1.14':{name:'Corn (grain)',BCDp:[20,45,75],Kc:[0.2,1.05,0.6],plant:[5,1],harvest:[9,30]},
  '1.15':{name:'Corn (silage)',BCDp:[20,45,100],Kc:[0.2,1,1],plant:[3,15],harvest:[9,30]},
  '1.16':{name:'Cotton',BCDp:[15,25,85],Kc:[0.35,0.95,0.5],plant:[4,1],harvest:[12,27]},
  '1.17':{name:'Cucumber ',BCDp:[19,47,85],Kc:[0.8,0.85,0.85],plant:[5,1],harvest:[9,10]},
  '1.18':{name:'Eggplant',BCDp:[23,54,85],Kc:[0.8,0.9,0.85],plant:[4,15],harvest:[8,15]},
  '1.19':{name:'Flax',BCDp:[17,45,80],Kc:[0.2,1.1,0.25],plant:[4,1],harvest:[8,31]},
  '1.2':{name:'Grains (small)',BCDp:[20,45,75],Kc:[0.33,1.1,0.15],plant:[3,1],harvest:[8,31]},
  '1.21':{name:'Grains (winter)',BCDp:[20,45,75],Kc:[0.33,1.05,0.15],plant:[11,1],harvest:[5,31]},
  '1.22':{name:'Garlic',BCDp:[25,73,92],Kc:[0.55,1.3,0.2],plant:[4,1],harvest:[11,15]},
  '1.23':{name:'Lentil',BCDp:[24,40,91],Kc:[0.2,1,0.1],plant:[1,1],harvest:[12,31]},
  '1.24':{name:'Lettuce',BCDp:[25,65,90],Kc:[0.8,0.8,0.8],plant:[1,1],harvest:[12,31]},
  '1.25':{name:'Melon',BCDp:[21,50,83],Kc:[0.8,0.95,0.75],plant:[1,1],harvest:[12,31]},
  '1.26':{name:'Millet',BCDp:[14,36,75],Kc:[0.3,1,0.3],plant:[1,1],harvest:[12,31]},
  '1.27':{name:'Mustard',BCDp:[25,63,88],Kc:[0.3,1,0.85],plant:[3,1],harvest:[10,15]},
  '1.28':{name:'Oats',BCDp:[20,45,75],Kc:[0.33,1.1,0.15],plant:[4,1],harvest:[11,15]},
  '1.29':{name:'Onion (dry)',BCDp:[10,26,75],Kc:[0.55,1.2,0.55],plant:[4,1],harvest:[11,1]},
  '1.3':{name:'Onion (green)',BCDp:[25,70,90],Kc:[0.55,1.2,0.55],plant:[4,1],harvest:[11,1]},
  '1.31':{name:'Peas',BCDp:[20,47,83],Kc:[0.2,1,1],plant:[4,1],harvest:[11,1]},
  '1.32':{name:'Peppers',BCDp:[20,45,85],Kc:[0.8,1,0.85],plant:[5,1],harvest:[10,31]},
  '1.33':{name:'Rice',BCDp:[24,37,86],Kc:[1.2,1.05,0.8],plant:[3,1],harvest:[10,15]},
  '1.34':{name:'Radishes',BCDp:[20,45,85],Kc:[0.8,0.85,0.75],plant:[4,1],harvest:[11,15]},
  '1.35':{name:'Potatoes',BCDp:[20,45,78],Kc:[0.8,1.1,0.7],plant:[4,1],harvest:[10,15]},
  '1.36':{name:'Safflower',BCDp:[17,45,80],Kc:[0.2,1.05,0.25],plant:[4,1],harvest:[10,15]},
  '1.37':{name:'Sisal',BCDp:[17,45,80],Kc:[0.2,1.05,0.25],plant:[1,1],harvest:[12,31]},
  '1.38':{name:'Sorghum',BCDp:[16,42,75],Kc:[0.2,1.05,0.5],plant:[1,1],harvest:[12,31]},
  '1.39':{name:'Spinach',BCDp:[33,67,92],Kc:[0.8,0.95,0.9],plant:[1,1],harvest:[12,31]},
  '1.4':{name:'Squash',BCDp:[20,50,80],Kc:[0.52,0.9,0.7],plant:[1,1],harvest:[12,31]},
  '1.41':{name:'Strawberries w/mulch',BCDp:[15,45,80],Kc:[0.2,0.7,0.7],plant:[1,1],harvest:[12,31]},
  '1.42':{name:'Sugarbeet',BCDp:[15,45,80],Kc:[0.2,1.15,0.95],plant:[1,1],harvest:[12,31]},
  '1.43':{name:'Sugarcane',BCDp:[17,44,78],Kc:[0.4,1.25,0.75],plant:[1,1],harvest:[12,31]},
  '1.44':{name:'Sunflower',BCDp:[20,45,80],Kc:[0.2,1.1,0.4],plant:[5,1],harvest:[9,10]},
  '1.45':{name:'Sweet Potatoes',BCDp:[20,45,78],Kc:[0.8,1.1,0.7],plant:[4,15],harvest:[8,15]},
  '1.46':{name:'Tomatoes',BCDp:[25,50,80],Kc:[0.3,1.1,0.65],plant:[4,1],harvest:[8,31]},
  '1.47':{name:'Vegetables',BCDp:[33,67,92],Kc:[0.8,0.9,0.9],plant:[3,1],harvest:[8,31]},
  '1.48':{name:'Wheat',BCDp:[20,45,75],Kc:[0.33,1.1,0.15],plant:[11,1],harvest:[5,31]},
  '1.49':{name:'Watermelon',BCDp:[20,50,75],Kc:[0.8,1,0.75],plant:[4,1],harvest:[11,15]},
  '2.01':{name:'Alfalfa (annual)',BCDp:[25,50,75],Kc:[1,1,1],plant:[1,1],harvest:[12,31]},
  '2.02':{name:'Improved Pasture',BCDp:[25,50,75],Kc:[0.95,0.95,0.95],plant:[1,1],harvest:[12,31]},
  '2.03':{name:'Turfgrass (cool-season)',BCDp:[25,50,75],Kc:[0.8,0.8,0.8],plant:[1,1],harvest:[12,31]},
  '2.04':{name:'Turfgrass (warm-season)',BCDp:[25,50,75],Kc:[0.6,0.6,0.6],plant:[1,1],harvest:[12,31]},
  '3.01':{name:'Almonds',BCDp:[0,50,90],Kc:[0.55,1.15,0.65],plant:[3,1],harvest:[10,15]},
  '3.02':{name:'Apple',BCDp:[0,50,75],Kc:[0.55,1.15,0.8],plant:[4,1],harvest:[11,15]},
  '3.03':{name:'Wine Grapes',BCDp:[0,25,75],Kc:[0.45,0.8,0.35],plant:[4,1],harvest:[11,1]},
  '3.04':{name:'Table Grapes',BCDp:[0,25,75],Kc:[0.45,1.05,0.35],plant:[4,1],harvest:[11,1]},
  '3.05':{name:'Raisin Grapes',BCDp:[0,25,75],Kc:[0.35,1.1,0.8],plant:[4,1],harvest:[11,1]},
  '3.06':{name:'Kiwifruit',BCDp:[0,22,67],Kc:[0.3,1.05,1],plant:[5,1],harvest:[10,31]},
  '3.07':{name:'Stone fruits',BCDp:[0,50,90],Kc:[0.55,1.15,0.65],plant:[3,1],harvest:[10,15]},
  '3.08':{name:'Walnuts',BCDp:[0,50,75],Kc:[0.55,1.15,0.8],plant:[4,1],harvest:[11,15]},
  '3.09':{name:'Peach',BCDp:[0,50,90],Kc:[0.55,1.2,0.65],plant:[4,1],harvest:[10,15]},
  '3.1':{name:'Plum-Prune',BCDp:[0,50,90],Kc:[0.55,1.15,0.65],plant:[4,1],harvest:[10,15]},
  '4.01':{name:'Avocado',BCDp:[0,33,67],Kc:[0.7,0.7,0.7],plant:[1,1],harvest:[12,31]},
  '4.02':{name:'Grapefruit',BCDp:[0,33,67],Kc:[1,1,1],plant:[1,1],harvest:[12,31]},
  '4.03':{name:'Lemon',BCDp:[0,33,67],Kc:[0.9,0.9,0.9],plant:[1,1],harvest:[12,31]},
  '4.04':{name:'Date Palm',BCDp:[0,33,67],Kc:[0.95,0.95,0.95],plant:[1,1],harvest:[12,31]},
  '4.05':{name:'Evergreen',BCDp:[0,33,67],Kc:[1.15,1.15,1.15],plant:[1,1],harvest:[12,31]},
  '4.06':{name:'Olives',BCDp:[0,33,67],Kc:[0.8,0.8,0.8],plant:[1,1],harvest:[12,31]},
  '4.07':{name:'Orange',BCDp:[0,33,67],Kc:[1,1,1],plant:[1,1],harvest:[12,31]}
};

var crop_def = function(number) {
    return Crops[number];
};

var crop_schedule = function(number,plant,harvest) {
  var A,B,C,D,E;
  var year,diff,days;

  var crop = crop_def(number);

  if (typeof plant === 'object' ) {
    if (typeof harvest === 'object') {
      A = plant;
      E = harvest;
      diff = E-A;
    } else {
      year=plant.getFullYear(); // First get length of default harvest
      A = new Date(year,crop.plant[0]-1,crop.plant[1]);
      E = new Date((crop.plant[0]<crop.harvest[0])?year:year+1,crop.harvest[0]-1,crop.harvest[1]);
      var diff = E-A;
      // Now get moved days
      A = plant;
      E = new Date(A.getTime()+diff);
    }
  } else {
    if (typeof plant === 'number') {
      year=plant;
    } else {
      year = new Date(Date.now()).getFullYear();
    }
    A = new Date(year,crop.plant[0]-1,crop.plant[1]);
    E = new Date((crop.plant[0]<crop.harvest[0])?year:year+1,crop.harvest[0]-1,crop.harvest[1]);
    diff = E-A;
  }
  var days = Math.round(diff/1000/60/60/24);
  var B = new Date(A.getTime()+diff*crop.BCDp[0]/100);
  var C = new Date(A.getTime()+diff*crop.BCDp[1]/100);
  var D = new Date(A.getTime()+diff*crop.BCDp[2]/100);
  return {
    number:number,
    name:crop.name,
    BCDp:crop.BCDp,
    Kc:crop.Kc,
    A:A,
    B:B,
    C:C,
    D:D,
    E:E,
    days:days
  };
};

var Kc = function(c,d) {
  d = (typeof d !== 'undefined') ? d : new Date(Date.now());
  if (typeof c !== 'object') {
    c = crop_schedule(sched,d.getFullYear());
  }
  if (d < c.A) {
    return undef;
  } else if (d < c.B) {
    return c.Kc[0];
  } else if (d < c.C) {
    return c.Kc[0] + (c.Kc[1]-c.Kc[0])*(d-c.B)/(c.C-c.B);
  } else if (d < c.D) {
    return c.Kc[1];
  } else if (d < c.E) {
    return c.Kc[1] + (c.Kc[2]-c.Kc[1])*(d-c.B)/(c.C-c.B);
  } else {
    return undef;
  }
};

module.exports = {
  crop_def:crop_def,
  crop_schedule:crop_schedule,
  Kc:Kc
}
