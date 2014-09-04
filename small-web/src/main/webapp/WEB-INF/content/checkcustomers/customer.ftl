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
	//}, {
	//	xtype: 'combo',
	//	fieldLabel: '配偶性别',
	//	name: 'matesex',
	//	store: genderStore,
	//	valueField: 'id',
	//	displayField: 'value'
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
	title: '    担保人信息',
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
		allowBlank: false
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
	//anchor: '100% 20.5%',
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
		fieldLabel: '开户银行',
		name: 'bankaccount'
	}, {
		fieldLabel: ' 贷款年限',
		name: 'years',
		xtype: 'numberfield',
		minValue: 1
	}, {
		fieldLabel: '是否GPS',
		name: 'isgps',
		xtype: 'checkbox',
		inputValue: true
	}, {
		fieldLabel: '贷款分期',
		name: 'stages',
		xtype: 'numberfield',
		minValue: 1
	}, {
		fieldLabel: '购车类型',
		xtype: 'combobox',
		name: 'cartype',
	    store: carStore,
	    queryMode: 'local',
	    displayField: 'name',
	    valueField: 'code'
	}, {
		fieldLabel: '车价(元)',
		name: 'carprice',
		xtype: 'numberfield',
		allowDecimals: true,
		decimalPrecision: 4
	}, {
		fieldLabel: '贷款金额(元)',
		name: 'carloans',
		xtype: 'numberfield',
		allowDecimals: true,
		decimalPrecision: 4
	}, {
		fieldLabel: '贷款利率',
		name: 'carrate',
		xtype: 'numberfield',
		allowDecimals: true,
		decimalPrecision: 4
	}, {
		fieldLabel: '佣金(元)',
		name: 'carbrokerage',
		xtype: 'numberfield',
		allowDecimals: true,
		decimalPrecision: 4
	}, {
		fieldLabel: '打款对象',
		name: 'cartoobject'
	}, {
		fieldLabel: '打款账户',
		name: 'cartoaccount'
	}, {
		fieldLabel: '保证金(元)',
		xtype: 'numberfield',
		allowDecimals: true,
		decimalPrecision: 4,
		name: 'bail'
	}, {
		fieldLabel: '公证费(元)',
		name: 'notaryfees',
		xtype: 'numberfield',
		allowDecimals: true,
		decimalPrecision: 4
	}, {
		fieldLabel: '担保费(元)',
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
var lianxirenpanel = Ext.create('Ext.panel.Panel', {
	title: '紧急联系人',
	layout: 'column',
	collapsible: true,
	defaults: {
		columnWidth: 0.25,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items:[{
		fieldLabel: '联系人一姓名',
		xtype: 'textfield',
		allowBlank: false,
		name: 'lianxiren1'
	}, {
		fieldLabel: '联系人一电话',
		xtype: 'textfield',
		allowBlank: false,
		name: 'lianxiren1dianhua'
	}, {
		fieldLabel: '联系人一性别',
		name: 'lianxiren1sex',
		xtype: 'combo',
		store: genderStore,
		valueField: 'id',
		displayField: 'value',
		allowBlank: false,
		editable: false
	}, {
		fieldLabel: '与借款人关系',
		xtype: 'textfield',
		allowBlank: false,
		name: 'lianxiren1guanxi'
	}, {
		fieldLabel: '联系人二姓名',
		xtype: 'textfield',
		name: 'lianxiren2'
	}, {
		fieldLabel: '联系人二电话',
		xtype: 'textfield',
		name: 'lianxiren2dianhua'
	}, {
		fieldLabel: '联系人二性别',
		name: 'lianxiren2sex',
		xtype: 'combo',
		store: genderStore,
		valueField: 'id',
		displayField: 'value',
		editable: false
	}, {
		fieldLabel: '与借款人关系',
		xtype: 'textfield',
		name: 'lianxiren2guanxi'
	}]
});
var createPanel = Ext.create('Ext.panel.Panel', {
	title: '创建信息',
	layout: 'column',
	collapsible: true,
	//anchor: '100% 8%',
	defaults: {
		columnWidth: 0.5,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items:[ {
		fieldLabel: '创建日期',
		xtype: 'xdatefield',
		name: 'created',
		format: 'Y-m-d H:i:s',
		readOnly: true
	}, {
		fieldLabel: '创建人',
		xtype: 'xcombo',
    	name: 'createdby',
    	store: userStore,
		triggerAction: 'all',
		selectOnFocus: true,
		editable: false,
		queryMode: 'local',
		valueField: 'id',
		readOnly: true,
		displayField: 'username'
	}]
});

var customerForm = Ext.create('Ext.form.Panel', {
	items: [loanerPanel, matePanel, guaranteePanel, carPanel, lianxirenpanel,createPanel, {
		xtype: 'panel',
		height: 100,
		layout: 'column',
		id: 'customerFile',
		items: [{
	    	xtype: 'button',
	    	columnWidth: 0.09,
	    	text: '添加附件',
	    	iconCls:'y-action-attachment',
	    	handler: function(){
	    		var con = this.up('panel').query('[addFieldContainer]')[0];
	    		con.add({
	    			xtype: 'xfilefield',
	    			itemName: 'customerfile'
	    		});
	    	}
	    }, {
	    	xtype: 'fieldcontainer',
	    	addFieldContainer: true,
	    	layout: 'anchor',
	    	columnWidth: 0.91
	    }]
	}]
});

var customerTab = {
	autoScroll: true,
	//layout: 'anchor',
	//layout: 'fit',
	itemId: 'customer',
	title: '担保信息维护',
	items: customerForm,
	listeners: {
		activate: function(){
			var fieldSet = Ext.getCmp('customerFile');
			fieldSet.query('[addFieldContainer]')[0].removeAll();
			var form = customerForm.getForm();
			var config = {
				url: '${request.contextPath}/customers/customer/new.gson',
				method: 'GET',
				callback: function(options, success, response) {
					var values = Ext.decode(response.responseText);
					form.setValues(values);
					var fields = form.getFields();
					fields.each(function(field){
						field.setReadOnly(false);
						field.validate();
					});
				}
			};
			if(App.currentId){
				config = {
					url: '${request.contextPath}/customers/customer/' + App.currentId + '.gson',
					success: function(response){
						var values = Ext.decode(response.responseText);
						var flow = values.isFlow;
						form.setValues(values);
						var fields = form.getFields();
						fields.each(function(field){
							field.setReadOnly(true);
							field.validate();
							field.resetOriginalValue();
						});
					}
				};
			}
			Ext.Ajax.request(config);
		}
	}
};
