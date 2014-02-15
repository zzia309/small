<#include "search.ftl">
var chart = Ext.create('Ext.chart.Chart', {
	columnWidth: 0.62,
	height: 220,
	animate: true,
	store: typeBusinessStore,
	shadow: true,
	legend: {
	    position: 'right',
	    labelFont: '8px Helvetica, sans-serif',
	    padding: 4,
	    itemSpacing: 5
	},
	insetPadding: 35,
	theme: 'Base:gradients',
	series: [{
	    type: 'pie',
	    field: 'total',
	    showInLegend: true,
	    donut: false,
	    tips: {
	      trackMouse: true,
	      width: 120,
	      height: 40,
	      renderer: function(storeItem, item) {
	        var total = 0;
	        typeBusinessStore.each(function(rec) {
	            total += rec.get('total');
	        });
	        var total1 = Math.round(storeItem.get('total'));
	        var type = storeItem.get('type');
	        var sum = storeItem.get('sum');

	        this.setTitle(type+": 共"+total1 +"笔 , 贷款总额"+sum+"元");
	      }
	    },
	    highlight: {
	      segment: {
	        margin: 20
	      }
	    },
	    label: {
	        field: 'type',
	        display: 'rotate',
	        contrast: true,
	        font: '10px Arial'
	    }
	}]
});

var bussinesscountchart = Ext.create('Ext.panel.Panel',	{
	layout: 'column',
	height: 220,
	title: '业务类型贷款统计',
	columnWidth: 0.5,
	items: [searchPanel, chart]
});