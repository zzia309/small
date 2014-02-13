var timeStore = Ext.create('Ext.data.Store', {
	fields: ['code', 'name'],
	data:[{'code': 'customer', 'name': '自定义日期'},
		{'code': 'thisMonth', 'name': '本月'},
		{'code': 'lastMonth', 'name': '上月'},
		]
});

var typeStore = Ext.create('Ext.data.Store', {
	fields:['name','code'],
	data:[
	  {name: '二手车', code: '二手车'},
	  {name: '新车', code: '新车'}
	]
});

var timePanel = Ext.create('Ext.form.FieldContainer',{
    layout: 'hbox',
    columnWidth: 1,
    margin:'2 0 2 0',
    defaults: {
    	labelWidth: 60,
		labelAlign: 'right'
	},
    items:[{
    	fieldLabel: '时间',
		xtype: 'combo',
		name: 'date',
		queryMode: 'local',
		editable:'false',
		triggerAction:'all',
		valueField: 'code',
		displayField: 'name',
		store: timeStore,
		listeners: {
			change: function(view, newValue, oldValue, eOpts){
				var form = searchPanel.getForm();
				var date = form.findField('date').getValue();
				var customerContainer = Ext.getCmp('customContainer').setVisible(false);
				var start = form.findField('start');
				var end = form.findField('end');
				start.setValue();
				end.setValue();
				if(date == 'customer')
					customerContainer.setVisible(true);
				else{

				}
			}
		}
    }, {
		xtype:'container',
		layout: 'hbox',
		hidden: true,
		id:'customContainer',
		width:310,
		items:[{
			margin:'0 2 0 2',
			xtype: 'datefield',
			name: 'start',
			format: 'Y-m-d H:i:s',
		},{
			xtype:'label',
			text: '到'
		},{
			margin:'0 2 0 2',
			labelAlign: 'right',
			name: 'end',
			xtype: 'datefield',
			format: 'Y-m-d H:i:s'
		}]
	}, {
    	fieldLabel: '业务类型',
		xtype: 'combo',
		name: 'type',
		queryMode: 'local',
		editable:'false',
		triggerAction:'all',
		valueField: 'code',
		displayField: 'name',
		store: typeStore
    },{
    	fieldLabel: '区域',
		xtype: 'combo',
		name: 'area',
		queryMode: 'local',
		editable:'false',
		triggerAction:'all',
		valueField: 'code',
		displayField: 'name',
		store: typeStore
    }]
});

var mixSearchPanel = Ext.create('Ext.form.FieldContainer',{
	layout: 'hbox',
	columnWidth: 1,
	margin:'2 0 2 35',
	width:500,
	defaults: {
    	labelWidth: 60,
		labelAlign: 'right'
	},
    items:[{
		xtype:'textfield',
		id:'name',
		name: 'condition',
		margin: '0 2 0 2',
		emptyText: '输入ID/客户姓名/客户身份证/业务员名称',
		width: 340
	},{
		xtype: 'button',
		text: '查询',
		margin: '0 2 0 2',
		width:100,
		handler:function(){
			var me = this;
			var form = me.up('form').getForm();
			var condition = form.findField('condition').getValue();
			var type = form.findField('type').getValue();
			var area = form.findField('area').getValue();
			businessStore.proxy.extraParams = {};
			if(!Ext.isEmpty(condition))
				businessStore.proxy.extraParams['condition'] = condition;
			if(!Ext.isEmpty(type))
				businessStore.proxy.extraParams['type'] = type;
			if(!Ext.isEmpty(area))
				businessStore.proxy.extraParams['area'] = area;
			businessStore.load();

		}
	}]
});
var searchPanel = Ext.create('Ext.form.Panel',{
	region: 'north',
	layout: 'column',
	items:[timePanel, mixSearchPanel]
});