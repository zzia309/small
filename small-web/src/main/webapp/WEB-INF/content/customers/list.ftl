var store = Ext.create('Ext.data.Store', {
     model: 'Model.Customer',
     proxy: {
		type: 'ajax',
		url: '${request.contextPath}/customers/list.gson',
		reader: {
			type: 'json',
			root: 'models'
		}
	},
	pageSize: 25,
	autoLoad: true
 });

 var userStore = Ext.create('Ext.data.Store', {
	 fields: ['id', 'username'],
     proxy: {
		type: 'ajax',
		url: '${request.contextPath}/stores/user-store.gson',
		reader: {
			type: 'json',
			root: 'model'
		}
	},
	autoLoad: true
 });

var listgrid = Ext.create('Ext.grid.Panel', {
	tbar:[{
		xtype: 'textfield',
		id: 'searchField',
		width: 300,
		emptyText: '客户姓名/身份证或担保人姓名/身份证号/车牌号',
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
		header: '客户姓名',
		dataIndex: 'loanername',
		renderer: function(value, meta, record, rowIndex, colIndex){
			var flow = record.raw.isFlow;
			if(flow)
				return '<span style="color:#EE2C2C;">' + value + '</span>';
			return value;
		}
	}, {
		header: '客户性别',
		dataIndex: 'loanersex'
	}, {
		header: '客户年龄',
		dataIndex: 'loanerage'
	}, {
		header: '客户身份证',
		dataIndex: 'loanercard'
	}, {
		header: '客户电话',
		dataIndex: 'loanertel'
	}, {
		header: '客户家庭住址',
		dataIndex: 'loanerhomeaddress'
	}, {
		header: '客户所在单位',
		dataIndex: 'loanerunit'
	}, {
		header: '客户单位电话',
		dataIndex: 'loanerunittel'
	}, {
		header: '客户单位地址',
		dataIndex: 'loanerunitaddress'
	}, {
		header: '客户职位',
		dataIndex: 'loanerposition'
	}, {
		header: '客户婚姻状态',
		dataIndex: 'loanermarry'
	}, {
		header: '客户籍贯',
		dataIndex: 'loanerbirthplace'
	}, {
		header: '客户户口所在地',
		dataIndex: 'loanerhukou'
	},{
		header: '配偶姓名',
		dataIndex: 'matename'
	}, {
		header: '配偶年龄',
		dataIndex: 'mateage'
	}, {
		header: '配偶身份证',
		dataIndex: 'matecard'
	}, {
		header: '配偶电话',
		dataIndex: 'matetel'
	}, {
		header: '配偶所在单位',
		dataIndex: 'mateunit'
	}, {
		header: '配偶单位电话',
		dataIndex: 'mateunittel'
	}, {
		header: '配偶单位地址',
		dataIndex: 'mateunitaddress'
	}, {
		header: '配偶职位',
		dataIndex: 'mateposition'
	}, {
		header: '配偶籍贯',
		dataIndex: 'matebirthplace'
	}, {
		header: '配偶户口所在地',
		dataIndex: 'matehukou'
	},{
		header: '担保人姓名',
		dataIndex: 'guaranteename'
	}, {
		header: '担保人性别',
		dataIndex: 'guaranteesex'
	}, {
		header: '担保人年龄',
		dataIndex: 'guaranteeage'
	}, {
		header: '担保人身份证',
		dataIndex: 'guaranteecard'
	}, {
		header: '担保人电话',
		dataIndex: 'guaranteetel'
	}, {
		header: '担保人家庭住址',
		dataIndex: 'guaranteehomeaddress'
	}, {
		header: '担保人所在单位',
		dataIndex: 'guaranteeunit'
	}, {
		header: '担保人单位电话',
		dataIndex: 'guaranteeunittel'
	}, {
		header: '担保人单位地址',
		dataIndex: 'guaranteeunitaddress'
	}, {
		header: '担保人职位',
		dataIndex: 'guaranteeposition'
	}, {
		header: '担保人婚姻状态',
		dataIndex: 'guaranteemarry'
	}, {
		header: '担保人所在地区',
		dataIndex: 'guaranteearea'
	}, {
		header: '担保人籍贯',
		dataIndex: 'guaranteebirthplace'
	}, {
		header: '担保人户口所在地',
		dataIndex: 'guaranteehukou'
	}, {
		header: '业务员',
		dataIndex: 'sales'
	}, {
		header: ' 经理',
		dataIndex: 'manager'
	}, {
		header: ' 贷款年限',
		dataIndex: 'years'
	}, {
		header: '贷款分期',
		dataIndex: 'stages'
	}, {
		header: '购车类型',
		dataIndex: 'cartype'
	}, {
		header: '车价',
		dataIndex: 'carprice'
	}, {
		header: '贷款金额',
		dataIndex: 'carloans'
	}, {
		header: '贷款利率',
		dataIndex: 'carrate'
	}, {
		header: '佣金',
		dataIndex: 'carbrokerage'
	}, {
		header: '打款对象',
		dataIndex: 'cartoobject'
	}, {
		header: '打款账户',
		dataIndex: 'cartoaccount'
	}, {
		header: '保证金',
		dataIndex: 'bail'
	}, {
		header: '公证费',
		dataIndex: 'notaryfees'
	}, {
		header: '担保费',
		dataIndex: 'guaranteefees'
	}, {
		header: '其他费用',
		dataIndex: 'otherfees'
	},{
		header: '是否流程',
		dataIndex: 'isFlow',
		renderer: function(value){
			if(value)
				return "是";
			else
				return "否"
		}
	},{
		header: '创建人',
		dataIndex: 'createdby',
		renderer: function(value){
			if(value)
				return value['username'];
		}
	},{
		xtype: 'xdatecolumn',
		header: '创建日期',
		format: 'Y-m-d',
		dataIndex: 'created'
	},{
		header: '担保人配偶姓名',
		dataIndex: 'guaranteematename'
	},{
		header: '担保人配偶身份证',
		dataIndex: 'guaranteematecard'
	},{
		header: '担保人配偶电话',
		dataIndex: 'guaranteematetel'
	},{
		header: '是否银行担保',
		dataIndex: 'isbank',
		renderer: function(value){
			if(value)
				return "是";
			else
				return "否"
		}
	},{
		header: '银行账号',
		dataIndex: 'bankaccount'
	},{
		header: '是否GPS',
		dataIndex: 'isgps',
		renderer: function(value){
			if(value)
				return "是";
			else
				return "否"
		}
	},{
		header: '首付',
		dataIndex: 'prepayments'
	},{
		header: '车辆上牌地区',
		dataIndex: 'listedareas'
	},{
		header: '经销商',
		dataIndex: 'dealer'
	},{
		header: '紧急联系人1',
		dataIndex: 'lianxiren1'
	},{
		header: '紧急联系人1性别',
		dataIndex: 'lianxiren1sex'
	},{
		header: '紧急联系人1电话',
		dataIndex: 'lianxiren1dianhua'
	},{
		header: '与借款人关系',
		dataIndex: 'lianxiren1guanxi'
	},{
		header: '紧急联系人2',
		dataIndex: 'lianxiren2'
	},{
		header: '紧急联系人2性别',
		dataIndex: 'lianxiren2sex'
	},{
		header: '紧急联系人2电话',
		dataIndex: 'lianxiren2dianhua'
	},{
		header: '与借款人关系',
		dataIndex: 'lianxiren2guanxi'
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
			console.log(App.currentId);
			App.openTab('customer', App.currentId);
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
