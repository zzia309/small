<#include "../commons/dateUtil.ftl">

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

var typeBusinessStore = Ext.create('Ext.data.Store', {
	 fields: ['total', 'sum', 'type'],
     proxy: {
		type: 'ajax',
		url: '${request.contextPath}/stores/type-business-store.gson',
		reader: {
			type: 'json',
			root: 'model'
		}
	},
	autoLoad: true
 });

var carStore = Ext.create('Ext.data.Store', {
	fields:['name','code'],
	data:[
	  {name: '新车卡分期', code: '新车卡分期'},
	  {name: '新车普通', code: '新车普通'},
	  {name: '二手车', code: '二手车'},
	  {name: '存量车', code: '存量车'},
	  {name: '公牌', code: '公牌'},
	  {name: '货车', code: '货车'},
	  {name: '租赁零首付', code: '租赁零首付'},
	  {name: '租赁', code: '租赁'},
	  {name: '租赁二手车', code: '租赁二手车'},
	  {name: '其他', code: '其他'}
	]
});

var searchPanel = Ext.create('Ext.form.Panel',{
	columnWidth: 0.38,
	height: 250,
	layout: 'column',
    defaults: {
	    margin:'2 0 2 0',
    	labelWidth: 60,
		labelAlign: 'right'
	},
	items:[{
    	fieldLabel: '时间',
		xtype: 'combo',
		name: 'date',
		columnWidth: 1,
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
				var start = form.findField('start');
				var end = form.findField('end');
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
    }, {
    	fieldLabel: '起始时间',
		xtype: 'datefield',
		name: 'start',
		format: 'Y-m-d H:i:s',
		columnWidth: 1,
		hidden: true
    }, {
    	fieldLabel: '结束时间',
		labelAlign: 'right',
		name: 'end',
		columnWidth: 1,
		xtype: 'datefield',
		format: 'Y-m-d H:i:s',
		hidden: true
    }, {
    	fieldLabel: '业务类型',
		xtype: 'combo',
		name: 'type',
		columnWidth: 1,
		queryMode: 'local',
		editable:'false',
		triggerAction:'all',
		valueField: 'code',
		displayField: 'name',
		store: carStore
    },{
    	fieldLabel: '区域',
		xtype: 'combo',
		name: 'branch',
		columnWidth: 1,
		queryMode: 'local',
		editable:'false',
		triggerAction:'all',
		valueField: 'code',
		displayField: 'name',
		store: carStore
    },{
    	fieldLabel: '业务员',
    	xtype: 'textfield',
    	name: 'sales',
    	columnWidth: 1,
    },{
		xtype: 'button',
		text: '查询',
		margin:'2 0 2 0',
		columnWidth: 0.5,
		handler:function(){
			var me = this;
			var form = me.up('form').getForm();
			var start = form.findField('start').getValue();
			var end = form.findField('end').getValue();
			var type = form.findField('type').getValue();
			var branch = form.findField('branch').getValue();
			var sales = form.findField('sales').getValue();
			typeBusinessStore.proxy.extraParams = {};
			if(!Ext.isEmpty(start) && !Ext.isEmpty(end)){
				start1 = Ext.Date.format(start, 'Y-m-d H:i:s');
				end1 = Ext.Date.format(end, 'Y-m-d H:i:s');
				typeBusinessStore.proxy.extraParams['start'] = start1;
				typeBusinessStore.proxy.extraParams['end'] = end1;
			}
			if(!Ext.isEmpty(type))
				typeBusinessStore.proxy.extraParams['type'] = type;
			if(!Ext.isEmpty(branch))
				typeBusinessStore.proxy.extraParams['branch'] = branch;
			if(!Ext.isEmpty(sales))
				typeBusinessStore.proxy.extraParams['sales'] = sales;
			typeBusinessStore.load();
		}
	}, {
		xtype: 'button',
		text: '清空搜索',
		columnWidth: 0.5,
		handler: function(){
			var me = this;
			var form = me.up('form').getForm();
			var fields = form.getFields();
			fields.each(function(field){
				field.setValue();
			});
		}
	}]
});
