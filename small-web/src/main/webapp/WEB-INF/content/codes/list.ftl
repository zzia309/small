var store = Ext.create('Ext.data.Store', {
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

var typeStore = Ext.create('Ext.data.Store', {
	fields:['name','code'],
	data:[
	  {code: 'BANK_STORE', name: '银行'},
	  {code: 'CAR_TYPE_STORE', name: '业务类型'},
	  {code: 'AREA_STORE', name: '经销商'}
	]
});

var listgrid = Ext.create('Ext.grid.Panel', {
	tbar:[{
		xtype: 'textfield',
		id: '#searchField',
		width: 120,
		emptyText: '类型/代码/显示名称',
		listeners: {
			change: function(oldvalue, newvalue) {
				store.proxy.extraParams = {};
				if(!Ext.isEmpty(newValue))
					store.proxy.extraParams['type'] = newvalue;
			}
		}
	},{
		xtype: 'button',
		text: '搜索',
		icon: '${request.contextPath}/statics/style/img/action/search.png',
		handler: function() {
			store.load();
		}
	}, {
		xtype: 'button',
		icon: '${request.contextPath}/statics/style/img/action/add.png',
		text: '新增基本信息',
		handler: function(){
			App.currentId = null;
			App.openTab('code', App.currentId);
		}
	},{
		xtype: 'button',
		text: '修改基本信息',
		icon: '${request.contextPath}/statics/style/img/action/edit.png',
		handler: function(){
			App.openTab('code', App.currentId);
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
	store: store,
	dockedItems: [{
		xtype: 'pagingtoolbar',
		store: store,
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