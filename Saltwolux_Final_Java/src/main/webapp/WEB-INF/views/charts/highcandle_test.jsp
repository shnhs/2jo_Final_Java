<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#candlecontainer {
    height: 400px;
    min-width: 310px;
}
</style>


</head>
<body>
<div id="candlecontainer"></div>
<script src="https://code.highcharts.com/stock/highstock.js"></script>
<script src="https://code.highcharts.com/stock/modules/data.js"></script>
<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>
<script src="https://code.highcharts.com/stock/modules/hollowcandlestick.js"></script>

<script>
Highcharts.getJSON('https://demo-live-data.highcharts.com/aapl-ohlcv.json', function (data) {
    Highcharts.stockChart('candlecontainer', {
        rangeSelector: {
            selected: 1
        },
        navigator: {
            series: {
                color: Highcharts.getOptions().colors[0]
            }
        },
        series: [{
            type: 'hollowcandlestick',
            name: 'Hollow Candlestick',
            data: data
        }]
    });
});

</script>
</body>
</html>