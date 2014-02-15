var timeStore = Ext.create('Ext.data.Store', {
	fields: ['code', 'name', 'total'],
	data:[{'code': 'customer', 'name': '自定义日期'},
		{'code': 'today', 'name': '今天'},
		{'code': 'yesterday', 'name': '昨天'},
		{'code': 'thisMonth', 'name': '本月'},
		{'code': 'lastMonth', 'name': '上月'},
		{'code': 'thisYear', 'name': '今年'},
		]
});

var typeProfitStore = Ext.create('Ext.data.Store', {
	 fields: ['sum', 'type', 'total'],
     proxy: {
		type: 'ajax',
		url: '${request.contextPath}/stores/profits-store.gson',
		reader: {
			type: 'json',
			root: 'models'
		}
	},
	autoLoad: true
 });

var profitStore = Ext.create('Ext.data.Store', {
	 fields: ['sum', 'type'],
     proxy: {
		type: 'ajax',
		url: '${request.contextPath}/stores/profits-store.gson',
		reader: {
			type: 'json',
			root: 'list'
		}
	},
	autoLoad: true
 });


var profitgrid = Ext.create('Ext.grid.Panel', {
	columnWidth: 0.3,
	height: 220,
	header: false,
	autoScroll: true,
	columns: [{
		header: '业务类型',
		dataIndex: 'type',
		height: 18,
		flex: 1
	}, {
		header: '销售利润',
		height: 18,
		dataIndex: 'sum',
		flex: 1
	}],
	store: profitStore
});

var profitchart = Ext.create('Ext.chart.Chart', {
	columnWidth: 0.7,
	height: 220,
    style: 'background:#fff',
    animate: true,
    shadow: true,
    store: typeProfitStore,
    axes: [{
        type: 'Numeric',
        position: 'left',
        fields: ['sum'],
        label: {
            renderer: Ext.util.Format.numberRenderer('0,0')
        },
        grid: true,
        minimum: 0
    }, {
	    type: 'Category',
	    position: 'bottom',
	    fields: ['type'],
	    label: {
            rotate: {
                degrees: 315
            }
        },
	    title: '业务类型'
	}],
    series: [{
        type: 'column',
        axis: 'left',
        highlight: true,
        tips: {
          trackMouse: true,
          width: 120,
	      height: 40,
          renderer: function(storeItem, item) {
          	var type = storeItem.get('type');
          	var sum = storeItem.get('sum');
          	var total = storeItem.get('total');
          	if(Ext.isEmpty(sum))
          		sum = 0;
      		if(Ext.isEmpty(total))
      			total = 0;
            this.setTitle( type+ ': 共'+total+"笔, 利润为"+ sum+"元");
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

var profitcountchart = Ext.create('Ext.panel.Panel',	{
	layout: 'column',
	columnWidth: 0.5,
	title: '业务利润统计',
	items: [profitgrid, profitchart],
	height: 220,
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
						var start = Ext.getCmp('#start');
						var end = Ext.getCmp('#end');
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
				id: '#start',
				format: 'Y-m-d H:i:s',
				width: 150,
				empty: '起始时间',
				hidden: true
		    }, {
		    	width: 150,
				id: '#end',
				name: 'end',
				xtype: 'datefield',
				empty: '结束时间',
				format: 'Y-m-d H:i:s',
				hidden: true
		    },{
				xtype: 'button',
				text: '搜索',
				handler: function(){
					var start = Ext.getCmp('#start').getValue();
					var end = Ext.getCmp('#end').getValue();
					typeProfitStore.proxy.extraParams = {};
					profitStore.proxy.extraParams = {};
					if(!Ext.isEmpty(start) && !Ext.isEmpty('end')){
						typeProfitStore.proxy.extraParams['start'] = start;
						typeProfitStore.proxy.extraParams['end'] = end;
						profitStore.proxy.extraParams['start'] = start;
						profitStore.proxy.extraParams['end'] = end;
					}
					typeProfitStore.load();
					profitStore.load();
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