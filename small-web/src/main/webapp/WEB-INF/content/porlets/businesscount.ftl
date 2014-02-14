var store1 = Ext.create('Ext.data.Store', {
	fields:['total','name'],
	data: [
	  {name: '浙江泰隆商业银行(融悦)', total: 23},
	  {name: '杭州银行清泰支行(融悦)', total: 32},
	  {name: '杭州银行清泰支行(易顺)', total: 34},
	  {name: '浙江泰隆商业银行(樊郡等)', total: 123}
	]
});

var chart = Ext.create('Ext.chart.Chart', {
			height: 300,
            animate: true,
            store: store1,
            shadow: true,
            legend: {
                position: 'right'
            },
            theme: 'Base:gradients',
            series: [{
                type: 'pie',
                field: 'total',
                showInLegend: true,
                donut: false,
                tips: {
                  trackMouse: true,
                  renderer: function(storeItem, item) {
                    //calculate percentage.
                    var total = 0;
                    store1.each(function(rec) {
                        total += rec.get('total');
                    });
                    this.setTitle(storeItem.get('name') + ': ' + Math.round(storeItem.get('total') / total * 100) + '%');
                  }
                },
                highlight: {
                  segment: {
                    margin: 20
                  }
                },
                label: {
                    field: 'name',
                    display: 'rotate',
                    contrast: true,
                    font: '18px Arial'
                }
            }]
        });