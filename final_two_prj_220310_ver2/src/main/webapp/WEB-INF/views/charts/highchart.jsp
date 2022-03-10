<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<style>
#candlecontainer {
    height: 400px;
    min-width: 310px;
}

#linecontainer { .highcharts-figure , .highcharts-data-table table {
   min-width:360px;
   max-width: 800px;
   margin: 1em auto;
}

.highcharts-data-table table {
   font-family: Verdana, sans-serif;
   border-collapse: collapse;
   border: 1px solid #ebebeb;
   margin: 10px auto;
   text-align: center;
   width: 100%;
   max-width: 500px;
}

.highcharts-data-table caption {
   padding: 1em 0;
   font-size: 1.2em;
   color: #555;
}

.highcharts-data-table th {
   font-weight: 600;
   padding: 0.5em;
}

.highcharts-data-table td, .highcharts-data-table th,
   .highcharts-data-table caption {
   padding: 0.5em;
}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
   {
   background: #f8f8f8;
}

.highcharts-data-table tr:hover {
   background: #f1f7ff;
}

}

.highcharts-figure,
.highcharts-data-table table {
    min-width: 360px;
    max-width: 800px;
    margin: 1em auto;
}


<!-- wordcloud -->	



</style>

<!--  stock candle chart -->
<script src="https://code.highcharts.com/stock/highstock.js"></script>
<script src="https://code.highcharts.com/stock/modules/data.js"></script>
<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>
<script src="https://code.highcharts.com/stock/modules/hollowcandlestick.js"></script>

<!-- line chart -->
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<!--  heatmap, wordcloud -->
<script src="https://code.highcharts.com/modules/heatmap.js"></script>
<script src="https://code.highcharts.com/modules/wordcloud.js"></script>

<script>
/* =======================
	create wordcloud
======================= */
function CreateWordCloud(wc_data){

	const wc_text = JSON.parse(wc_data);
	const p_text = wc_text.pos_keyword;
	const n_text= wc_text.neg_keyword;	
	const all_text = wc_text.all_keyword;

p_lines = p_text.split(/[,\. ]+/g),
n_lines = n_text.split(/[,\. ]+/g),
all_lines = all_text.split(/[,\. ]+/g),

p_data = p_lines.reduce((p_arr, word) => 
{let p_obj = Highcharts.find(p_arr, p_obj => p_obj.name === word);
    if (p_obj) {
    	p_obj.weight += 1;
    } else {
    	p_obj = {
            name: word,
            weight: 1
        };
        p_arr.push(p_obj);
    }
    return p_arr;
}, []);

// 일정 빈도수 이상만 워드 클라우드로 뿌리기
var p_result=[];
var p_THRESHOLD=3
for( var item of p_data){
	if (item.weight > p_THRESHOLD){
		p_result.push(item)
	}
}

n_data = n_lines.reduce((n_arr, word) => 
{let n_obj = Highcharts.find(n_arr, n_obj => n_obj.name === word);
    if (n_obj) {
    	n_obj.weight += 1;
    } else {
    	n_obj = {
            name: word,
            weight: 1
        };
        n_arr.push(n_obj);
    }
    return n_arr;
}, []);

//일정 빈도수 이상만 워드 클라우드로 뿌리기
var n_result=[];
var n_THRESHOLD=3
for( var item of n_data){
	if (item.weight > n_THRESHOLD){
		n_result.push(item)
	}
}


all_data = all_lines.reduce((all_arr, word) => 
{let all_obj = Highcharts.find(all_arr, all_obj => all_obj.name === word);
    if (all_obj) {
    	all_obj.weight += 1;
    } else {
    	all_obj = {
            name: word,
            weight: 1
        };
    	all_arr.push(all_obj);
    }
    return all_arr;
}, []);

// 일정 빈도수 이상만 워드 클라우드로 뿌리기
var all_result=[];
var all_THRESHOLD=3
for( var item of all_data){
	if (item.weight > all_THRESHOLD){
		all_result.push(item)
	}
}




/* 워드 클라우드 버전 초기*/
Highcharts.chart('wordcloud_chart', {
accessibility: {
    screenReaderSection: {
        beforeChartFormat: '<h5>{chartTitle}</h5>' +
            '<div>{chartSubtitle}</div>' +
            '<div>{chartLongdesc}</div>' +
            '<div>{viewTableButton}</div>'
    }
},
series: [{
	id : 'series-positive',
	name:'긍정',
    type: 'wordcloud',
	showInLegend: true,
    data : p_result,
	}, {
	id : 'series-all',
	name:'전체',
	type: 'wordcloud',
	showInLegend: true,
	data: all_result,
},{
	id : 'series-negative',
	name:'부정',
	type: 'wordcloud',
	showInLegend: true,
	data: n_result,
}],
credits: {enabled: false},
title: {
    text: ' '
}
});


/* 워드 클라우드 버전 x비율 3개*/
Highcharts.chart('wordcloud_chart_x3', {
accessibility: {
    screenReaderSection: {
        beforeChartFormat: '<h5>{chartTitle}</h5>' +
            '<div>{chartSubtitle}</div>' +
            '<div>{chartLongdesc}</div>' +
            '<div>{viewTableButton}</div>'
    }
},
xAxis:[{
	width:'33%'
},
{
	left:'33%',
	width:'33%'
},
{
	left:'66%',
	width:'33%'
}],

series: [{
	id : 'series-positive',
	name:'긍정',
    type: 'wordcloud',
	showInLegend: true,
    data : p_result,
	}, {
	id : 'series-all',
	name:'전체',
	type: 'wordcloud',
	showInLegend: true,
	data: all_result,
	xAxis:1
},{
	id : 'series-negative',
	name:'부정',
	type: 'wordcloud',
	showInLegend: true,
	data: n_result,
	xAxis:2
}],
credits: {enabled: false},
title: {
    text: ' '
}
});

/* 워드 클라우드 버전 pos*/
Highcharts.chart('wordcloud_chart_pos', {
accessibility: {
    screenReaderSection: {
        beforeChartFormat: '<h5>{chartTitle}</h5>' +
            '<div>{chartSubtitle}</div>' +
            '<div>{chartLongdesc}</div>' +
            '<div>{viewTableButton}</div>'
    }
},
series: [{
	id : 'series-positive',
	name:'긍정',
    type: 'wordcloud',
    data : p_result,
	}],
credits: {enabled: false},
title: {
    text: ' '
}
});

/* 워드 클라우드 버전 neg*/
Highcharts.chart('wordcloud_chart_neg', {
	accessibility: {
	    screenReaderSection: {
	        beforeChartFormat: '<h5>{chartTitle}</h5>' +
	            '<div>{chartSubtitle}</div>' +
	            '<div>{chartLongdesc}</div>' +
	            '<div>{viewTableButton}</div>'
	    }
	},
	series: [{
		id : 'series-negative',
		name:'부정',
		type: 'wordcloud',
		showInLegend: true,
		data: n_result,
	}],
	credits: {enabled: false},
	title: {
	    text: ' '
	}
	}); 
	
/* 워드 클라우드 버전  all*/
Highcharts.chart('wordcloud_chart_all', {
	accessibility: {
	    screenReaderSection: {
	        beforeChartFormat: '<h5>{chartTitle}</h5>' +
	            '<div>{chartSubtitle}</div>' +
	            '<div>{chartLongdesc}</div>' +
	            '<div>{viewTableButton}</div>'
	    }
	},
	series: [{
		id : 'series-all',
		name:'all',
		type: 'wordcloud',
		showInLegend: true,
		data: all_result,
	}],
	credits: {enabled: false},
	title: {
	    text: ' '
	}
	}); 
 

} 
/* =======================
	create heatmap
======================= */
function getPointCategoryName(point, dimension) {
    var series = point.series,
        isY = dimension === 'y',
        axis = series[isY ? 'yAxis' : 'xAxis'];
    return axis.categories[point[isY ? 'y' : 'x']];
}
function CreateHeatMap(heat_data){

   var heat_json = JSON.parse(heat_data)
   //console.log(heat_json.cor_value[0])
   Highcharts.chart('heatmap_chart', {
   
    chart: {
        type: 'heatmap',
        marginTop: 40,
        marginBottom: 80,
        plotBorderWidth: 1
    },

    title: {
        text: ' '
    },
    credits: {enabled: false},
    xAxis: {
        categories: ['News', 'stock']
    },

    yAxis: {
        categories: ['News', 'stock'],
        title: null,
        reversed: true
    },

    accessibility: {
        point: {
            descriptionFormatter: function (point) {
                var ix = point.index + 1,
                    xName = getPointCategoryName(point, 'x'),
                    yName = getPointCategoryName(point, 'y'),
                    val = point.value;
                return ix + '. ' + xName + ' sales ' + yName + ', ' + val + '.';
            }
        }
    },

    colorAxis: {
        min: 0,
        minColor: '#FFFFFF',
        maxColor: Highcharts.getOptions().colors[0]
    },

    legend: {
        align: 'right',
        layout: 'vertical',
        margin: 0,
        verticalAlign: 'top',
        y: 25,
        symbolHeight: 280
    },

    tooltip: {
        formatter: function () {
            return '<b>' + getPointCategoryName(this.point, 'x') + '</b> sold <br><b>' +
                this.point.value + '</b> items on <br><b>' + getPointCategoryName(this.point, 'y') + '</b>';
        }
    },

    series: [{
        name: 'News-stock correlation',
        borderWidth: 1,
        data: heat_json.cor_value,
        
        dataLabels: {
            enabled: true,
            color: '#000000'
        }
    }],

    responsive: {
        rules: [{
            condition: {
                maxWidth: 500
            },
            chartOptions: {
                yAxis: {
                    labels: {
                        formatter: function () {
                            return this.value.charAt(0);
                        }
                    }
                }
            }
        }]
    }

});
};

/* =======================
	  create candle
======================= */
function CreateCandleChart(data){

   var stock_json = JSON.parse(data)
  //console.log(stock_json.s_code)
   
   Highcharts.setOptions({
         lang: {
            thousandsSep: ','
         }
   });
   
    Highcharts.stockChart('candle_chart', {
       title: {
         text: ' '
      },
        rangeSelector: {
        	buttons: [{
        	    type: 'month',
        	    count: 1,
        	    text: '1M',
        	    title: 'View 1 month'
        	}, {
        	    type: 'month',
        	    count: 3,
        	    text: '3M',
        	    title: 'View 3 months'
        	}, {
        	    type: 'month',
        	    count: 6,
        	    text: '6M',
        	    title: 'View 6 months'
        	}, {
        	    type: 'year',
        	    count: 1,
        	    text: '1년',
        	    title: 'View 1 year'
        	}, {
        	    type: 'all',
        	    text: '전체',
        	    title: 'View all'
        	}],
            selected: 1
            
        },
        credits: {enabled: false},
        navigator: {
            series: {
                color: Highcharts.getOptions().colors[0]
            },
            opposite: false
        },
        plotOptions: {
         candlestick: {
            downColor: 'blue',
            upColor: 'red'
         }
      },
        series: [{
            type: 'candlestick',
            name: stock_json.s_code,
            data: stock_json.stock_data,
            tooltip: {
               labels : {
               format: '{value:,.0f}',
            }
         }
        }]
    });
};

/* =======================
		create line
======================= */
function CreateLineChart(data) {
   
    var line = JSON.parse(data)      
    //console.log(line.cor_date)
    //console.log(line.cor_news)
    Highcharts.chart('line_chart', {

       title : {
          text : ' '
       },
       subtitle : {
           text : ' '
        },
       rangeSelector: {
    	   enabled:true,
    	   allButtonsEnabled: true,
    	   buttons: [{
       	    type: 'month',
       	    count: 1,
       	    text: '1M',
       	    title: 'View 1 month'
       	}, {
       	    type: 'month',
       	    count: 3,
       	    text: '3M',
       	    title: 'View 3 months'
       	}, {
       	    type: 'month',
       	    count: 6,
       	    text: '6M',
       	    title: 'View 6 months'
       	},  {
       	    type: 'year',
       	    count: 1,
       	    text: '1년',
       	    title: 'View 1 year'
       	}, {
       	    type: 'all',
       	    text: '전체',
       	    title: 'View all'
       	}],
           selected: 1
           
       },
       credits: {enabled: false},

       yAxis : {
          title : {
             text : 'normalization'
          }
       },

       xAxis: {
          title : {
               text : 'date'
            },
            accessibility: {
             rangeDescription: 'Range: 2017 to 2021'
           }
           ,  type:"datetime"
           , dateTimeLabelFormats : {
             day: '%Y. %m. %d'
           }
         },
       

       legend : {
          layout : 'vertical',
          align : 'right',
          verticalAlign : 'middle'
       },

       plotOptions: {
           series: {
             label: {
               connectorAllowed: false // 선과 라벨 연결여부 (true : 연결, false : 미연결)
             },
             pointStart: line.cor_date[0], // Axis 타입 datetime 일 경우 주석한 2개 사용
             pointInterval: 24 * 3600 * 1000 
           }
         },

       series : [{
          name : '뉴스 긍부정',
          data : line.cor_news

       }, {
          name : '주가 등락률',
          data : line.cor_stock
       } ],
       navigator: {
    	   handles:{
    		   enabled:true  
    	   },
    	   adaptToUpdatedData: true,
           enabled: true //네비게이터 활성화
       },
       

       responsive : {
          rules : [ {
             condition : {
                maxWidth : 500
             },
             chartOptions : {
                legend : {
                   layout : 'horizontal',
                   align : 'center',
                   verticalAlign : 'bottom'
                }
             }
          } ]
       }

    });

 };
 
 $(function() {
      $("button[type=button]").click(function() {  
        
 	  		 var form = $("#elementForm")[0]
 	  		 var form_data = new FormData(form);     
        
         $("button[type=button]").prop("disabled", false);
                $.ajax({
                    url : "http://127.0.0.1:5000/",
                    async : true,
                    type : "POST",
                    data : form_data, 
                    
                    contentType: false,
                    processData: false,
                    success : function(get_data) {
                       console.log(get_data)
               
                      CreateCandleChart(get_data); // Create Chart using the defined arrays
                      CreateLineChart(get_data);
                      CreateHeatMap(get_data);
                      CreateWordCloud(get_data);
                       $("button[type=button]").prop("disabled", false);
                    }, 
            error : function(e) {
               console.log("ERROR : ", e);
               console.log(form_data);
               alert("검색 옵션 값을 확인해주세요.");
            }
         });
      })
   });
</script>