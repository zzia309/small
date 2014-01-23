var woFlowStore = Ext.create('Ext.data.Store', {
	fields: [{
		name: 'id'
	}, {
		name: 'wo'
	}, {
		name: 'oldStatus'
	}, {
		name: 'status'
	}, {
		name: 'descr'
	}, {
		name: 'createdby.fullname'
	}, {
		name: 'created'
	}],
	data:[],
	autoLoad: false
});
var woFlowPanel = Ext.create('Ext.grid.Panel', {
	store: woFlowStore,
	autoScroll: true,
	anchor: '100%',
	height: 200,
	columns: [{
		dataIndex: 'id',
		hidden: true
	}, {
		header: 'business记录',
		dataIndex: 'wo',
		hidden: true
	}, {
		header: '上一状态',
		dataIndex: 'oldStatus',
		flex: 1
	}, {
		header: '新状态',
		dataIndex: 'status',
		flex: 1
	}, {
		header: '提示信息',
		dataIndex: 'descr',
		flex: 1
	}, {
		header: '创建人',
		dataIndex: 'createdby.fullname',
		flex: 1
	}, {
		xtype: 'xdatecolumn',
		header: '创建日期',
		dataIndex: 'created',
		format: 'Y-m-d H:i:s',
		flex: 1
	}],
	listeners:{
		itemclick: function(view, record) {
			if(record) {
				//var des = Ext.getCmp('des');
				//des.setValue(record.get('descr'));
				//des.resetOriginalValue();
			}
		}
	}
});