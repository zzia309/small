var carStore = Ext.create('Ext.data.Store', {
	fields:['name','code'],
	data:[
	  {name: '二手车', code: '二手车'},
	  {name: '新车', code: '新车'}
	]
});

var loanerPanel = Ext.create('Ext.panel.Panel', {
	title: '贷款人信息',
	layout: 'column',
	collapsible: true,
	anchor: '100% 24%',
	defaultType: 'textfield',
	defaults: {
		columnWidth: 0.3333,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items:[{
		fieldLabel: '客户姓名',
		name: 'loanername',
		allowBlank: false
	}, {
		xtype: 'combo',
		fieldLabel: '客户性别',
		name: 'loanersex',
		store: genderStore,
		valueField: 'id',
		displayField: 'value'
	}, {
		xtype: 'numberfield',
		fieldLabel: '客户年龄',
		name: 'loanerage',
		maxValue: 57,
        minValue: 20
	}, {
		fieldLabel: '客户身份证',
		name: 'loanercard'
	}, {
		fieldLabel: '客户电话',
		name: 'loanertel'
	}, {
		fieldLabel: '客户家庭住址',
		name: 'loanerhomeaddress'
	}, {
		fieldLabel: '客户所在单位',
		name: 'loanerunit'
	}, {
		fieldLabel: '客户单位电话',
		name: 'loanerunittel'
	}, {
		fieldLabel: '客户单位地址',
		name: 'loanerunitaddress'
	}, {
		fieldLabel: '客户职位',
		name: 'loanerposition'
	}, {
		fieldLabel: '客户婚姻状态',
		name: 'loanermarry'
	}, {
		fieldLabel: '客户所在地区',
		name: 'loanerarea'
	}, {
		fieldLabel: '客户籍贯',
		name: 'loanerbirthplace'
	}, {
		fieldLabel: '客户户口所在地',
		name: 'loanerhukou'
	}]
});

var matePanel = Ext.create('Ext.panel.Panel', {
	title: '贷款人配偶信息',
	layout: 'column',
	collapsible: true,
	anchor: '100% 20.5%',
	defaultType: 'textfield',
	defaults: {
		columnWidth: 0.3333,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items:[{
		fieldLabel: '配偶姓名',
		name: 'matename'
	}, {
		xtype: 'combo',
		fieldLabel: '配偶性别',
		name: 'matesex',
		store: genderStore,
		valueField: 'id',
		displayField: 'value'
	}, {
		xtype: 'numberfield',
		fieldLabel: '配偶年龄',
		name: 'mateage',
		minValue: 20
	}, {
		fieldLabel: '配偶身份证',
		name: 'matecard'
	}, {
		fieldLabel: '配偶电话',
		name: 'matetel'
	}, {
		fieldLabel: '配偶所在单位',
		name: 'mateunit'
	}, {
		fieldLabel: '配偶单位电话',
		name: 'mateunittel'
	}, {
		fieldLabel: '配偶单位地址',
		name: 'mateunitaddress'
	}, {
		fieldLabel: '配偶职位',
		name: 'mateposition'
	}, {
		fieldLabel: '配偶籍贯',
		name: 'matebirthplace'
	}, {
		fieldLabel: '配偶户口所在地',
		name: 'matehukou'
	}]
});

var guaranteePanel = Ext.create('Ext.panel.Panel', {
	title: '担保人信息',
	layout: 'column',
	collapsible: true,
	anchor: '100% 24%',
	defaultType: 'textfield',
	defaults: {
		columnWidth: 0.3333,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items:[{
		fieldLabel: '担保人姓名',
		name: 'guaranteename'
	}, {
		xtype: 'combo',
		fieldLabel: '担保人性别',
		name: 'guaranteesex',
		store: genderStore,
		valueField: 'id',
		displayField: 'value'
	}, {
		xtype: 'numberfield',
		fieldLabel: '担保人年龄',
		name: 'guaranteeage',
        minValue: 20
	}, {
		fieldLabel: '担保人身份证',
		name: 'guaranteecard'
	}, {
		fieldLabel: '担保人电话',
		name: 'guaranteetel'
	}, {
		fieldLabel: '担保人家庭住址',
		name: 'guaranteehomeaddress'
	}, {
		fieldLabel: '担保人所在单位',
		name: 'guaranteeunit'
	}, {
		fieldLabel: '担保人单位电话',
		name: 'guaranteeunittel'
	}, {
		fieldLabel: '担保人单位地址',
		name: 'guaranteeunitaddress'
	}, {
		fieldLabel: '担保人职位',
		name: 'guaranteeposition'
	}, {
		fieldLabel: '担保人婚姻状态',
		name: 'guaranteemarry'
	}, {
		fieldLabel: '担保人所在地区',
		name: 'guaranteearea'
	}, {
		fieldLabel: '担保人籍贯',
		name: 'guaranteebirthplace'
	}, {
		fieldLabel: '担保人户口所在地',
		name: 'guaranteehukou'
	}]
});

var carPanel = Ext.create('Ext.panel.Panel', {
	title: '车辆及销售信息',
	layout: 'column',
	collapsible: true,
	anchor: '100% 20.5%',
	defaultType: 'textfield',
	defaults: {
		columnWidth: 0.25,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items:[ {
		fieldLabel: '业务员',
		name: 'sales'
	}, {
		fieldLabel: ' 经理',
		name: 'manager'
	}, {
		fieldLabel: ' 贷款年限',
		name: 'years'
	}, {
		fieldLabel: '贷款分期',
		name: 'stages'
	}, {
		fieldLabel: '购车类型',
		xtype: 'combobox',
		name: 'cartype',
	    store: carStore,
	    queryMode: 'local',
	    displayField: 'name',
	    valueField: 'code'
	}, {
		fieldLabel: '车价',
		name: 'carprice'
	}, {
		fieldLabel: '贷款金额',
		name: 'carloans'
	}, {
		fieldLabel: '贷款利率',
		name: 'carrate'
	}, {
		fieldLabel: '佣金',
		name: 'carbrokerage'
	}, {
		fieldLabel: '打款对象',
		name: 'cartoobject'
	}, {
		fieldLabel: '打款账户',
		name: 'cartoaccount'
	}, {
		fieldLabel: '保证金',
		name: 'bail'
	}, {
		fieldLabel: '公证费',
		name: 'notaryfees'
	}, {
		fieldLabel: '担保费',
		name: 'guaranteefees'
	}, {
		fieldLabel: '其他费用',
		name: 'otherfees'
	}]
});

var customerForm = Ext.create('Ext.form.Panel', {
	items: [loanerPanel, matePanel, guaranteePanel, carPanel],
	layout: 'anchor',
	anchor: '98.6% 120%'
});

var customerTab = {
	autoScroll: true,
	layout: 'anchor',
	itemId: 'customer',
	title: '客户信息维护',
	items: customerForm,
	listeners: {
		activate: function(){
			var form = customerForm.getForm();
			var fields = form.getFields();
			fields.each(function(field){
				//field.readOnlyCls = "required";
				field.setReadOnly(true);
			});
			if(App.currentId){
				Ext.Ajax.request({
					url: '${request.contextPath}/businesses/customer/' + App.currentId + '.gson',
					method: 'GET',
					success: function(response){
						var results = Ext.decode(response.responseText);
						var values = results['customer'];
						form.setValues(values);
						var fields = form.getFields();
						fields.each(function(field){
							field.resetOriginalValue();
						});
					}
				});
			}
		}
	}
};
