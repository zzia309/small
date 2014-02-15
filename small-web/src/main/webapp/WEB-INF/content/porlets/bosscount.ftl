var bossStore = Ext.create('Ext.data.Store', {
	 fields: ['sum', 'type', 'total'],
     proxy: {
		type: 'ajax',
		url: '${request.contextPath}/stores/boss-store.gson',
		reader: {
			type: 'json',
			root: 'model'
		}
	},
	autoLoad: true
 });


var advanceschart = Ext.create('Ext.chart.Chart', {
	columnWidth: 1,
	height: 200,
    style: 'background:#fff',
    animate: true,
    shadow: true,
    store: bossStore,
    axes: [{
        type: 'Numeric',
        position: 'bottom',
        fields: ['sum'],
        label: {
            renderer: Ext.util.Format.numberRenderer('0')
        },
        grid: true,
        minimum: 0
    }, {
	    type: 'Category',
	    position: 'left',
	    fields: ['type'],
	    label: {
            rotate: {
                degrees:0
            }
        }
	}],
    series: [{
        type: 'bar',
        axis: 'bottom',
        highlight: true,
        tips: {
          trackMouse: true,
          width: 180,
	      height: 40,
          renderer: function(storeItem, item) {
          	var type = storeItem.get('type');
          	var sum = storeItem.get('sum');
          	var total = storeItem.get('total');
          	if(Ext.isEmpty(sum))
          		sum = 0;
      		if(Ext.isEmpty(total))
      			total = 0;
            this.setTitle(type + ': 垫款金额为' + sum+"元, 共"+total+"笔");
          }
        },
        label: {
            display: 'insideEnd',
            'text-anchor': 'middle',
			field: 'sum',
			renderer: Ext.util.Format.numberRenderer('0'),
			orientation: 'vertical',
			color: '#333'
        },
        xField: 'type',
        yField: 'sum'
    }]
});
var bosscountchart = Ext.create('Ext.panel.Panel',	{
	layout: 'column',
	columnWidth: 0.5,
	title: '垫款统计',
	items: [advanceschart],
	height: 228,
	listeners: {
		afterrender: function(con){
			var items = [{
				emptyText: '选择时间',
				width: 100,
				xtype: 'combo',
				name: 'date',
				margin: '-1 -1 -1 -1',
				queryMode: 'local',
				editable:'false',
				triggerAction:'all',
				valueField: 'code',
				displayField: 'name',
				store: timeStore,
				listeners: {
					change: function(view, newValue, oldValue, eOpts){
						var date = newValue;
						var start = Ext.getCmp('@start');
						var end = Ext.getCmp('@end');
						var dateUtil = new DateProcess();
						start.setValue();
						end.setValue();
						if(date == 'customer'){
							start.setVisible(true);
							end.setVisible(true);
						}else{
							var o = dateUtil.getDate(date);
							start.setValue(o['start']);
							end.setValue(o['end']);
							start.setVisible(false);
							end.setVisible(false);
						}
					}
				}
			},{
				xtype: 'datefield',
				name: 'start',
				id: '@start',
				margin: '-1 -1 -1 -1',
				format: 'Y-m-d H:i:s',
				width: 150,
				empty: '起始时间',
				hidden: true
		    }, {
		    	width: 150,
				id: '@end',
				name: 'end',
				xtype: 'datefield',
				empty: '结束时间',
				format: 'Y-m-d H:i:s',
				hidden: true
		    },{
				xtype: 'button',
				margin: '-1 -1 -1 -1',
				text: '搜索',
				handler: function(){
					var start = Ext.getCmp('@start').getValue();
					var end = Ext.getCmp('@end').getValue();
					bossStore.proxy.extraParams = {};
					if(!Ext.isEmpty(start) && !Ext.isEmpty('end')){
						bossStore.proxy.extraParams['start'] = start;
						bossStore.proxy.extraParams['end'] = end;
					}
					bossStore.load();
				}
			}];
			con.header.insert(1,items);
		}

	},
	header: {
		minHeight: 25,
		maxHeight: 25,
	}
});