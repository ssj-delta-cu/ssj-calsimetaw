var cups=require('./cups');
var crops = {
1:{cups:'1.14',label:'Corn',C:[6,1],D:[8,1]},
2:{cups:'1.16',label:'Cotton',C:[6,1],D:[8,1]},
3:{cups:'1.33',label:'Rice',C:[6,1],D:[8,1]},
24:{cups:'1.48',label:'Winter Wheat',C:[6,1],D:[8,1]},
36:{cups:'2.01',label:'Alfalfa', C:[6,1],D:[8,1]},
54:{cups:'1.46',label:'Tomatoes',C:[6,1],D:[8,1]},
61:{label:'Fallow/Idle Cropland',C:[6,1],D:[8,1]},
69:{cups:'3.04',label:'Grapes',C:[6,1],D:[8,1]},
75:{cups:'3.01',label:'Almonds',C:[6,1],D:[8,1]},
76:{cups:'3.08',label:'Walnuts',C:[6,1],D:[8,1]},
};


var out={};

(Object.keys(crops)).map(function (c) {
  if (typeof crops[c].cups !== 'undefined') {
  var sc=cups.crop_schedule(crops[c].cups);
  out[c]={C:sc.C.getMonth()+1+'-'+sc.C.getDate(),D:sc.D.getMonth()+1+'-'+sc.D.getDate()};
}
});

console.log(out);
