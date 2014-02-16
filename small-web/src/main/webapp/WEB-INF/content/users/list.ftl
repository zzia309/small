var userStore = Ext.create('Ext.data.Store', {
     model: 'Model.User',
     proxy: {
		type: 'ajax',
		url: '${request.contextPath}/users/list.gson',
		reader: {
			type: 'json',
			root: 'models'
		}
	},
	pageSize: 25,
	autoLoad: true
 });

var listgrid = Ext.create('Ext.grid.Panel', {
	layout: 'anchor',
	tbar:[{
		xtype: 'textfield',
		id: 'searchField',
		listeners: {
			change: function(oldvalue, newvalue) {
				userStore.proxy.extraParams = {};
				userStore.proxy.extraParams['condition'] = newvalue;
			}
		}
	},{
		xtype: 'button',
		text: '搜索',
		icon: '${request.contextPath}/statics/style/img/action/search.png',
		handler: function() {
			var value = Ext.getCmp('searchField').getValue();
			if(!Ext.isEmpty(value)) {
				userStore.proxy.url = '${request.contextPath}/users/list.gson';
				userStore.load();
			}
		}
	}, {
		xtype: 'button',
		text: '新增用户信息',
		icon: '${request.contextPath}/statics/style/img/action/add.png',
		handler: function(){
			windows.show();
		}
	},{
		xtype: 'button',
		text: '修改用户资料',
		icon: '${request.contextPath}/statics/style/img/action/edit.png',
		handler: function(){
			windows.initData();
		}
	},{
		xtype: 'button',
		text: '删除用户资料',
		icon: '${request.contextPath}/statics/style/img/action/delete.png',
		handler: function() {
			var sm = listgrid.getSelectionModel();
			if(sm.hasSelection()){
				var record = sm.getSelection()[0];
				Ext.Ajax.request({
					url: "${request.contextPath}/users/user/"+record.get('id')+".gson",
					method: 'DELETE',
					success: function(response) {
						var values = Ext.decode(response.responseText);
						if(values.success) {
							Ext.Msg.alert('提醒', '删除成功！');
							listgrid.store.remove(record);
						}else
							Ext.Msg.alert('提醒', '删除失败！');
					}
				});
			}
		}
	}],
	dockedItems: [{
		xtype: 'pagingtoolbar',
		store: userStore,
		dock: 'bottom',
		displayInfo: true
	}],
	header: false,
	columns:[{
		header: 'ID',
		dataIndex: 'id'
	},{
		header: '用户名',
		flex: 1,
		dataIndex: 'username'
	},{
		header: '全名',
		flex: 1,
		dataIndex: 'fullname'
	},{
		header: '角色',
		flex: 1,
		dataIndex: 'priority',
		renderer: function(value) {
			if(value)
				return rolestore.getById(value).get('value');
		}
	},{
		header: '性别',
		flex: 1,
		dataIndex: 'gender',
		renderer: function(value) {
			if(value==='M')
				return '男';
			else if(value==='G')
				return '女';
		}
	},{
		header: '地址',
		flex: 1,
		dataIndex: 'address'
	},{
		header: '电话',
		flex: 1,
		dataIndex: 'tel'
	},{
		header: '手机',
		flex: 1,
		dataIndex: 'mobile'
	},{
		header: '邮箱',
		flex: 1,
		dataIndex: 'email'
	},{
		header: 'QQ',
		flex: 1,
		dataIndex: 'qq'
	},{
		xtype: 'xdatecolumn',
		header: '创建日期',
		flex: 1,
		format: 'Y-m-d',
		dataIndex: 'created'
	},{
		header: '创建人',
		flex: 1,
		dataIndex: 'createdby',
		renderer: function(value){
			if(value)
				return value['username'];
		}
	}],
	store: userStore,
	listeners: {
		itemdblclick: function(view, record, item, index, e, eOpts){
			windows.initData();
		}
	}
});

var listTab = {
	itemId: 'list',
	title: '用户信息维护',
	layout: 'fit',
	items: listgrid,
	edit: function(){},
	listeners: {
		activate: function() {
	    }
	}
};
