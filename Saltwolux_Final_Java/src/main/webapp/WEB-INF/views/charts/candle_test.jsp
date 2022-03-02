<!-- Styles -->
<style>
#chartdiv {
  width: 100%;
  height: 500px;
  max-width: 100%;
}
</style>

<!-- Resources -->
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>

<!-- Chart code -->
<script>
am5.ready(function() {

// Create root element
// https://www.amcharts.com/docs/v5/getting-started/#Root_element
var root = am5.Root.new("chartdiv");


// Set themes
// https://www.amcharts.com/docs/v5/concepts/themes/
root.setThemes([
  am5themes_Animated.new(root)
]);


// Create chart
// https://www.amcharts.com/docs/v5/charts/xy-chart/
var chart = root.container.children.push(am5xy.XYChart.new(root, {
  panX: true,
  panY: false,
  wheelX: "panX",
  wheelY: "zoomX",
  layout: root.verticalLayout
}));

chart.get("colors") .set("step", 2);


// Create axes
// https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
var valueAxisRenderer = am5xy.AxisRendererY.new(root, {
  inside: true
});
valueAxisRenderer.labels.template.setAll({
  centerY: am5.percent(100),
  maxPosition: 0.98
});
var valueAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
  renderer: valueAxisRenderer,
  height: am5.percent(70)
}));
valueAxis.axisHeader.children.push(am5.Label.new(root, {
  text: "Value",
  fontWeight: "bold",
  paddingBottom: 5,
  paddingTop: 5
}));

var volumeAxisRenderer = am5xy.AxisRendererY.new(root, {
  inside: true
});
volumeAxisRenderer.labels.template.setAll({
  centerY: am5.percent(100),
  maxPosition: 0.98
});
var volumeAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {  
  renderer: volumeAxisRenderer,
  height: am5.percent(30),
  layer: 5,
  numberFormat: "#a"
}));
volumeAxis.axisHeader.set("paddingTop", 10);
volumeAxis.axisHeader.children.push(am5.Label.new(root, {
  text: "Volume",
  fontWeight: "bold",
  paddingTop: 5,  
  paddingBottom: 5
}));


var dateAxisRenderer = am5xy.AxisRendererX.new(root, {});
dateAxisRenderer.labels.template.setAll({
  minPosition: 0.01,
  maxPosition: 0.99,
  minGridDistance: 40
});
var dateAxis = chart.xAxes.push(am5xy.GaplessDateAxis.new(root, {
  groupData: true,
  //groupCount: 20,
  baseInterval: { timeUnit: "day",  count: 1 },
  renderer: dateAxisRenderer
}));
dateAxis.set("tooltip", am5.Tooltip.new(root, {}));

var color = root.interfaceColors.get("background");

// Add series
// https://www.amcharts.com/docs/v5/charts/xy-chart/series/
var valueSeries = chart.series.push(
  am5xy.CandlestickSeries.new(root, {
    fill: color,
    clustered:false,
    calculateAggregates: true,
    stroke: color,
    name: "MSFT",
    xAxis: dateAxis,
    yAxis: valueAxis,
    valueYField: "Close",
    openValueYField: "Open",
    lowValueYField: "Low",
    highValueYField: "High",
    valueXField: "Date",
    lowValueYGrouped: "low",
    highValueYGrouped: "high",
    openValueYGrouped: "open",
    valueYGrouped: "close",
    legendValueText: "open: {openValueY} low: {lowValueY} high: {highValueY} close: {valueY}",
    legendRangeValueText: "{valueYClose}"
  })
);

var valueTooltip = valueSeries.set("tooltip", am5.Tooltip.new(root, {
  getFillFromSprite: false,
  getStrokeFromSprite: true,
  getLabelFillFromSprite: true,
  autoTextColor: false,
  pointerOrientation: "horizontal",
  labelText: "{name}: {valueY} {valueYChangePreviousPercent.formatNumber('[#00ff00]+#,###.##|[#ff0000]#,###.##|[#999999]0')}%"
}));
valueTooltip.get("background") .set("fill", root.interfaceColors.get("background"));
console.log(valueTooltip)


var firstColor = chart.get("colors") .getIndex(0);
var volumeSeries = chart.series.push(am5xy.ColumnSeries.new(root, {
  name: "MSFT",
  clustered:false,
  fill: firstColor,
  stroke: firstColor,
  valueYField: "Volume",
  valueXField: "Date",
  valueYGrouped: "sum",
  xAxis: dateAxis,
  yAxis: volumeAxis,
  legendValueText: "{valueY}",
  tooltip: am5.Tooltip.new(root, {
    labelText: "{valueY}"
  })
}));

volumeSeries.columns.template.setAll({
  //strokeWidth: 0.5,
  //strokeOpacity: 1,
  //stroke: am5.color(0xffffff)
});


// Add legend to axis header
// https://www.amcharts.com/docs/v5/charts/xy-chart/axes/axis-headers/
// https://www.amcharts.com/docs/v5/charts/xy-chart/legend-xy-series/
var valueLegend = valueAxis.axisHeader.children.push(
  am5.Legend.new(root, {
    useDefaultMarker: true
  })
);
valueLegend.data.setAll([valueSeries]);

var volumeLegend = volumeAxis.axisHeader.children.push(
  am5.Legend.new(root, {
    useDefaultMarker: true
  })
);
volumeLegend.data.setAll([volumeSeries]);


// Stack axes vertically
// https://www.amcharts.com/docs/v5/charts/xy-chart/axes/#Stacked_axes
chart.leftAxesContainer.set("layout", root.verticalLayout);


// Add cursor
// https://www.amcharts.com/docs/v5/charts/xy-chart/cursor/
chart.set("cursor", am5xy.XYCursor.new(root, {}))


// Add scrollbar
// https://www.amcharts.com/docs/v5/charts/xy-chart/scrollbars/
var scrollbar = chart.set("scrollbarX", am5xy.XYChartScrollbar.new(root, {
  orientation: "horizontal",
  height: 50
}));

var sbDateAxis = scrollbar.chart.xAxes.push(am5xy.DateAxis.new(root, {
  groupData: true,
  groupIntervals: [{
    timeUnit: "week",
    count: 1
  }],
  baseInterval: {
    timeUnit: "day",
    count: 1
  },
  renderer: am5xy.AxisRendererX.new(root, {})
}));

var sbValueAxis = scrollbar.chart.yAxes.push(
  am5xy.ValueAxis.new(root, {
    renderer: am5xy.AxisRendererY.new(root, {})
  })
);

var sbSeries = scrollbar.chart.series.push(am5xy.LineSeries.new(root, {
  valueYField: "Close",
  valueXField: "Date",
  xAxis: sbDateAxis,
  yAxis: sbValueAxis
}));

sbSeries.fills.template.setAll({
  visible: true,
  fillOpacity: 0.3
});


// Load external data
// https://www.amcharts.com/docs/v5/charts/xy-chart/series/#Setting_data
am5.net.load("/csv/stock_db.csv").then(function(result) {
  
  // Parse loaded data
  var data = am5.CSVParser.parse(result.response, {
    delimiter: ",",
    reverse: true,
    skipEmpty: true,
    useColumnNames: true
  });
  
  // Process data (convert dates and values)
  var processor = am5.DataProcessor.new(root, {
    dateFields: ["Date"],
    dateFormat: "yyyy-MM-dd",
    numericFields: ["Open", "High", "Low", "Close", "Volume"]
  });
  processor.processMany(data);
  
  console.log(data)
  
  // Set data
  valueSeries.data.setAll(data);
  volumeSeries.data.setAll(data);
  sbSeries.data.setAll(data);
});



// Make stuff animate on load
// https://www.amcharts.com/docs/v5/concepts/animations/
chart.appear(1000, 100);

}); // end am5.ready()
</script>

<!-- HTML -->
<div id="chartdiv"></div>