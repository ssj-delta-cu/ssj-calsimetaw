# Overview


The goal of this project is to capture the estimated $ET$ for the SSJ region using the methodology that is used in the CalSIMETAW Model.  CalSIMETAW encapsulates a number of different processes, including it's methodology in calculating $$ET$$, inclusion of $$ET$$ into a more comprehensive process that tracks a water balance and allows for the calculation of estimates like $$E_{taw}$$  

<script type="math/tex; mode=display">T'(t) = \lambda T(t)</script><script type="math/tex; mode=display">X''(x) = \lambda \alpha X(x)</script>

<iframe style="width: 100%; height: 600px" src="http://jsfiddle.net/RR8Ub/1/embedded/result,resources,js,html" seamless frameBorder="0">
</iframe>

<script src="http://d3js.org/d3.v3.min.js"></script>

<script>

    var dataArray = [20,40,50,100];
    var width = 500;
    var height = 500;
    var widthScale = d3.scale.linear()
                      .domain([0,100])
                      .range([0,width]);

    var colorScale = d3.scale.linear()
                      .domain([0,65])
                      .range(["red","blue"]);

    var canvas=d3.select("body")
      .append("svg")
      .attr("width",width)
      .attr("height",height);

    var bars=canvas.selectAll("rect")
              .data(dataArray)
              .enter()
                .append("rect")
                .attr("width",function(d) {return widthScale(d);})
                .attr("height",50)
                .attr("fill",function(d) { return colorScale(d);})
                .attr("y",function(d,i) { return i*60} );
  </script>
