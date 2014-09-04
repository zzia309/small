var descrWindow = Ext.create('Ext.window.Window', {
	title: '流程信息',
	width: 600,
	height: 650,
	layout: 'fit',
	closeAction: 'hide',
	items: [{
		xtype: 'textarea',
		id: 'descrInformation'
	}]
});

var woFlowStore = Ext.create('Ext.data.Store', {
	fields: ['id', 'wo', 'oldstatus', 'status', 'descr', 'buqicailiao', 'createdby', 'created'],
	data:[],
	autoLoad: false
});
var woFlowPanel = Ext.create('Ext.grid.Panel', {
	store: woFlowStore,
	autoScroll: true,
	region: 'center',
	title: '流程信息',
	columns: [{
		dataIndex: 'id',
		hidden: true
	}, {
		header: 'business记录',
		dataIndex: 'wo',
		hidden: true
	}, {
		header: '上一状态',
		dataIndex: 'oldstatus',
		flex: 1,
		renderer: function(value) {
			if(value) {
				var record =flowStore.findRecord('code',value);
				if(record)
					return record.get('name');
			}
		}
	}, {
		header: '新状态',
		dataIndex: 'status',
		flex: 1,
		renderer: function(value) {
			if(value) {
				var record =flowStore.findRecord('code',value);
				if(record)
					return record.get('name');
			}
		}
	}, {
		header: '提示信息',
		dataIndex: 'descr',
		flex: 10
	},
	<#if action.user?? && (action.user.priority == 4)>
	{
		header: '补齐材料',
		dataIndex: 'buqicailiao',
		flex: 3,
		renderer: function(value){
			if(value)
				return "<span style='color:red'>"+value+"</span>"
			return "";
		}
	},
	</#if>
	{
		header: '创建人',
		dataIndex: 'createdby',
		flex: 1,
		renderer: function(value) {
			if(value)
				return value['fullname'];
		}
	}, {
		xtype: 'xdatecolumn',
		header: '创建日期',
		dataIndex: 'created',
		format: 'Y-m-d H:i:s',
		flex: 2
	}],
	listeners:{
		itemdblclick: function(view, record) {
			if(record) {
				var des = Ext.getCmp('descrInformation');
				des.setValue(record.get('descr'));
				descrWindow.show();
				//var des = Ext.getCmp('des');
				//des.setValue(record.get('descr'));
				//des.resetOriginalValue();
			}
		}
	}

});