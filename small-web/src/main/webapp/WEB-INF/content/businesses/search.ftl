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

var timePanel = Ext.create('Ext.form.FieldContainer',{
    layout: 'hbox',
    columnWidth: 1,
    margin:'2 0 2 0',
    defaults: {
    	labelWidth: 60,
		labelAlign: 'right',
		width: 205
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
		width: 160,
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
		margin:'0 2 0 2',
		xtype: 'datefield',
		name: 'start',
		hidden: true,
		format: 'Y-m-d H:i:s'
	}, {
		fieldLabel: '结束时间',
		margin:'0 2 0 2',
		labelAlign: 'right',
		name: 'end',
		hidden: true,
		xtype: 'datefield',
		format: 'Y-m-d H:i:s'
	}, {
    	fieldLabel: '业务类型',
		xtype: 'combo',
		name: 'type',
		queryMode: 'local',
		editable:'false',
		triggerAction:'all',
		valueField: 'code',
		displayField: 'name',
		store: carStore
    },{
    	xtype: 'textfield',
		fieldLabel: '合作经销商',
		name: 'area',
		labelWidth: 70
    },{
    	fieldLabel: '车牌号',
    	xtype: 'textfield',
    	name: 'carno'
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
		width: 300
	},{
		xtype: 'button',
		text: '查询',
		margin: '0 2 0 2',
		width:80,
		handler:function(){
			var me = this;
			var form = me.up('form').getForm();
			var condition = form.findField('condition').getValue();
			var type = form.findField('type').getValue();
			var area = form.findField('area').getValue();
			var carno = form.findField('carno').getValue();
			businessStore.proxy.extraParams = {};
			if(!Ext.isEmpty(condition))
				businessStore.proxy.extraParams['condition'] = condition;
			if(!Ext.isEmpty(type))
				businessStore.proxy.extraParams['type'] = type;
			if(!Ext.isEmpty(area))
				businessStore.proxy.extraParams['area'] = area;
			if(!Ext.isEmpty(carno))
				businessStore.proxy.extraParams['carno'] = carno;
			var start = form.findField('start').getValue();
			var end = form.findField('end').getValue();
			if(!Ext.isEmpty(start) && !Ext.isEmpty(end)){
				start1 = Ext.Date.format(start, 'Y-m-d H:i:s');
				end1 = Ext.Date.format(end, 'Y-m-d H:i:s');
				businessStore.proxy.extraParams['starttime'] = start1;
				businessStore.proxy.extraParams['endtime'] = end1;
			}
			businessStore.load();
		}
	},{
		xtype: 'button',
		text: '清空查询条件',
		margin: '0 2 0 2',
		width:80,
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
var searchPanel = Ext.create('Ext.form.Panel',{
	region: 'north',
	layout: 'column',
	items:[timePanel, mixSearchPanel]
});
