var timeStore = Ext.create('Ext.data.Store', {
	fields: ['code', 'name'],
	data:[{'code': 'customer', 'name': '自定义日期'},
		{'code': 'today', 'name': '今天'},
		{'code': 'yesterday', 'name': '昨天'},
		{'code': 'thisMonth', 'name': '本月'},
		{'code': 'lastMonth', 'name': '上月'},
		{'code': 'thisYear', 'name': '今年'},
		]
});

var typeProfitStore = Ext.create('Ext.data.Store', {
	 fields: ['sum', 'type'],
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

var profitStore1 = Ext.create('Ext.data.Store', {
	 fields: ['sum', 'type'],
     proxy: {
		type: 'ajax',
		url: '${request.contextPath}/stores/profits.gson',
		reader: {
			type: 'json',
			root: 'list'
		}
	},
	autoLoad: true
 });

var profitStore = Ext.create('Ext.data.Store', {
	fields: ['type', 'sum'],
	data:[{
		'type': '新车卡分期', 'sum': '100'
	},{
		'type': '新车普通', 'sum': '200'
	},{
		'type': '二手车', 'sum': '100'
	},{
		'type': '存量车', 'sum': '200'
	},{
		'type': '公牌', 'sum': '100'
	},{
		'type': '货车', 'sum': '200'
	},{
		'type': '租赁零首付', 'sum': '100'
	},{
		'type': '租赁二手车', 'sum': '200'
	},{
		'type': '租赁', 'sum': '200'
	},{
		'type': '其他', 'sum': '200'
	}]
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
    store: profitStore,
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
                degrees: 45
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
            this.setTitle(storeItem.get('type') + ': ' + storeItem.get('sum'));
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
	collapsible: true,
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
				margin: '-1 -1 -1 -1',
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
				margin: '-1 -1 -1 -1',
				text: '搜索'
			}];
			con.header.insert(1,items);

		}

	},
	header: {
		minHeight: 25,
		maxHeight: 25,
	}
});