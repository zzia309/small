var listStore = Ext.create('Ext.data.Store', {
     model: 'Model.Code',
     proxy: {
		type: 'ajax',
		url: '${request.contextPath}/codes/list.gson',
		reader: {
			type: 'json',
			root: 'models'
		}
	},
	pageSize: 25,
	autoLoad: true
 });

var listgrid = Ext.create('Ext.grid.Panel', {
	tbar:[{
		xtype: 'textfield',
		id: 'searchField',
		width: 120,
		emptyText: '类型/代码/显示名称',
		listeners: {
			change: function(oldvalue, newvalue) {
				store.proxy.extraParams = {};
				store.proxy.extraParams['condition'] = newvalue;
			}
		}
	},{
		xtype: 'button',
		text: '搜索',
		icon: '${request.contextPath}/statics/style/img/action/search.png',
		handler: function() {
			listgrid.down('pagingtoolbar').moveFirst();
			store.proxy.url = '${request.contextPath}/customers/list.gson';
			store.load();
		}
	}, {
		xtype: 'button',
		icon: '${request.contextPath}/statics/style/img/action/add.png',
		text: '新增客户信息',
		handler: function(){
			App.currentId = null;
			App.openTab('customer', App.currentId);
		}
	},{
		xtype: 'button',
		text: '修改客户资料',
		icon: '${request.contextPath}/statics/style/img/action/edit.png',
		handler: function(){
			App.openTab('customer', App.currentId);
		}
	}],
	columns: [{
		header: 'ID',
		dataIndex: 'id'
	}, {
		header: '信息所属类型',
		dataIndex: 'type'
	}, {
		header: '代码',
		dataIndex: 'code'
	}, {
		header: '显示名称',
		dataIndex: 'name'
	}, {
		header: '创建人',
		dataIndex: 'createdby',
		renderer: function(value){
			if(value)
				return value['username'];
			else
				return '';
		}
	}, {
		xtype: 'xdatecolumn',
		header: '创建时间',
		dataIndex: 'created',
		width: 150,
		format: 'Y-m-d H:i:s'
	}],
	store: listStore,
	dockedItems: [{
		xtype: 'pagingtoolbar',
		store: listStore,
		dock: 'bottom',
		displayInfo: true
	}],
	listeners: {
		itemclick: function(view, record, item, index, e, eOpts){
			App.currentId = record.get("id");
		},
		itemdblclick: function(view, record, item, index, e, eOpts){
			App.openTab('code', App.currentId);
		}
	}
});

var listTab = {
	itemId: 'list',
	title: '列表',
	layout: 'fit',
	items: listgrid,
	edit: function(){},
	listeners: {
		activate: function() {
			var rec = listgrid.getSelectionModel().getSelection()[0];
			if(!rec)
				App.currentId = 0;
	    }
	}
};