<style>
#candlecontainer {
    height: 400px;
    min-width: 310px;
}
</style>

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
<div id="candlecontainer"></div>