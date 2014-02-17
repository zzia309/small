var loanerPanel = Ext.create('Ext.panel.Panel', {
	title: '贷款人信息',
	layout: 'column',
	collapsible: true,
	//anchor: '100% 24%',
	defaultType: 'textfield',
	defaults: {
		columnWidth: 0.3333,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items:[{
		name: 'id',
		hidden: true
	}, {
		fieldLabel: '客户姓名',
		name: 'loanername',
		allowBlank: false
	}, {
		xtype: 'combo',
		fieldLabel: '客户性别',
		name: 'loanersex',
		store: genderStore,
		valueField: 'id',
		displayField: 'value',
		editable: false,
		allowBlank: false
	}, {
		xtype: 'numberfield',
		fieldLabel: '客户年龄',
		name: 'loanerage',
		allowBlank: false,
		maxValue: 57,
        minValue: 20
	}, {
		fieldLabel: '客户身份证',
		name: 'loanercard',
		allowBlank: false
	}, {
		fieldLabel: '客户电话',
		name: 'loanertel',
		allowBlank: false
	}, {
		fieldLabel: '客户家庭住址',
		name: 'loanerhomeaddress',
		allowBlank: false
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
		xtype: 'combo',
		fieldLabel: '客户婚姻状态',
		name: 'loanermarry',
		store: marryStore,
		valueField: 'name',
		displayField: 'code',
		editable: false
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
	//anchor: '100% 20.5%',
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
	defaultType: 'textfield',
	defaults: {
		columnWidth: 0.3333,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items:[{
		fieldLabel: '担保人姓名',
		name: 'guaranteename',
		allowBlank: false
	}, {
		xtype: 'combo',
		fieldLabel: '担保人性别',
		name: 'guaranteesex',
		store: genderStore,
		valueField: 'id',
		displayField: 'value',
		allowBlank: false,
		editable: false
	}, {
		xtype: 'numberfield',
		fieldLabel: '担保人年龄',
		name: 'guaranteeage',
		allowBlank: false,
        minValue: 20
	}, {
		fieldLabel: '担保人身份证',
		name: 'guaranteecard',
		allowBlank: false
	}, {
		fieldLabel: '担保人电话',
		name: 'guaranteetel',
		allowBlank: false
	}, {
		fieldLabel: '担保人家庭住址',
		name: 'guaranteehomeaddress',
		allowBlank: false
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
		xtype: 'combo',
		fieldLabel: '担保人婚姻状态',
		name: 'guaranteemarry',
		store: marryStore,
		valueField: 'name',
		displayField: 'code',
		editable: false
	}, {
		fieldLabel: '担保人所在地区',
		name: 'guaranteearea'
	}, {
		fieldLabel: '担保人籍贯',
		name: 'guaranteebirthplace'
	}, {
		fieldLabel: '担保人户口所在地',
		name: 'guaranteehukou'
	}, {
		fieldLabel: '担保人配偶姓名',
		name: 'guaranteematename'
	}, {
		fieldLabel: '担保人配偶身份证',
		name: 'guaranteematecard'
	}, {
		fieldLabel: '担保人配偶电话',
		name: 'guaranteematetel'
	}, {
		fieldLabel: '是否银行担保',
		name: 'isbank',
		xtype: 'checkbox',
		inputValue: false
	}]
});

var carPanel = Ext.create('Ext.panel.Panel', {
	title: '车辆及销售信息',
	layout: 'column',
	collapsible: true,
	defaultType: 'textfield',
	defaults: {
		columnWidth: 0.2,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items:[{
		fieldLabel: '合作经销商',
		name: 'dealer'
	},{
		fieldLabel: '业务员',
		name: 'sales'
	}, {
		fieldLabel: ' 经理',
		name: 'manager'
	}, {
		fieldLabel: '购车类型',
		xtype: 'combobox',
		name: 'cartype',
	    store: carStore,
	    queryMode: 'local',
	    displayField: 'name',
	    valueField: 'code',
	    editable: false
	}, {
		fieldLabel: '车辆上牌地区',
		name: 'listedareas'
	}, {
		fieldLabel: '是否GPS',
		name: 'isgps',
		xtype: 'checkbox',
		inputValue: true
	}, {
		fieldLabel: '开户银行',
		name: 'bankaccount',
		columnWidth: 0.4,
	}, {
		fieldLabel: '打款对象',
		name: 'cartoobject'
	}, {
		fieldLabel: '打款账户',
		name: 'cartoaccount'
	}, {
		fieldLabel: '车价',
		name: 'carprice',
		xtype: 'numberfield',
		allowDecimals: true,
		decimalPrecision: 4
	}, {
		fieldLabel: '首付款',
		name: 'prepayments',
		xtype: 'numberfield',
		allowDecimals: true,
		decimalPrecision: 4
	}, {
		fieldLabel: ' 贷款年限',
		name: 'years',
		xtype: 'numberfield',
		minValue: 1
	}, {
		fieldLabel: '贷款分期',
		name: 'stages',
		xtype: 'numberfield',
		minValue: 1
	}, {
		fieldLabel: '贷款金额',
		name: 'carloans',
		xtype: 'numberfield',
		allowDecimals: true,
		decimalPrecision: 4
	}, {
		fieldLabel: '贷款利率(%)',
		name: 'carrate',
		xtype: 'numberfield',
		allowDecimals: true,
		decimalPrecision: 4,
		maxValue: 100,
		minValue: 0
	}, {
		fieldLabel: '佣金(%)',
		name: 'carbrokerage',
		xtype: 'numberfield',
		allowDecimals: true,
		decimalPrecision: 4,
		maxValue: 100,
		minValue: 0
	}, {
		fieldLabel: '保证金',
		xtype: 'numberfield',
		allowDecimals: true,
		decimalPrecision: 4,
		name: 'bail'
	}, {
		fieldLabel: '公证费',
		name: 'notaryfees',
		xtype: 'numberfield',
		allowDecimals: true,
		decimalPrecision: 4
	}, {
		fieldLabel: '担保费',
		name: 'guaranteefees',
		xtype: 'numberfield',
		allowDecimals: true,
		decimalPrecision: 4
	}, {
		fieldLabel: '其他费用',
		name: 'otherfees',
		columnWidth: 1
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
