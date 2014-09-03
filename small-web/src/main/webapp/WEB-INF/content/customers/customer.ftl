var loanerPanel = Ext.create('Ext.panel.Panel', {
	title: '贷款人信息',
	layout: 'column',
	collapsible: true,
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
		fieldLabel: '担保人性别',
		name: 'guaranteesex',
		xtype: 'combo',
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
		inputValue: true
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
	    editable: false,
	    allowBlank: false
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
		fieldLabel: '车价(元)',
		name: 'carprice',
		xtype: 'numberfield',
		allowDecimals: true,
		decimalPrecision: 4
	}, {
		fieldLabel: '首付款(元)',
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
		fieldLabel: '贷款金额(元)',
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
		fieldLabel: '其他费用(元)',
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
	items: [loanerPanel, matePanel, guaranteePanel, carPanel, lianxirenpanel, createPanel, {
		xtype: 'panel',
		height: 120,
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
	}],
	//layout: 'anchor',
	//anchor: '98.6% 120%',
	dockedItems: [{
	    xtype: 'toolbar',
	    dock: 'bottom',
	    itemId: 'tools',
	    ui: 'footer',
	    items: ['->',{
	    	xtype: 'button',
			text: '保存',
			itemId: 'save',
			icon: '${request.contextPath}/statics/style/img/action/save.png',
			disabled: true,
			formBind: true,
			handler: function(){
				var form = this.up('form').getForm();
				customerForm.suspendEvents();
				var mask = new Ext.LoadMask(Ext.getBody(), {
					msg: "正在保存。。。"
				});
				if(form.isValid()){
					var xfilefields =  this.up('form').query("[xtype=filefield]");
					var st = false;
					if(xfilefields.length>0) {
						Ext.Array.forEach(xfilefields, function(fileField) {
							if(fileField.getValue()) {
								st = true;
							}
						});
					}
					if(st) {
						progressWindow.show();
						fileInterVal = setInterval(interVal, 300);
					}else
						mask.show();
					var url = '${request.contextPath}/customers/customer.gson';
					var params = {};
					if(App.currentId){
						url = '${request.contextPath}/customers/customer/'+ App.currentId +'.gson';
						params = {
							_method: 'PUT'
						};
					}
					form.submit({
						url: url,
						params: params,
						success: function(form, action){
							var values = action.result;
							if(values.success){
								App.currentId = null;
								App.openTab('list');
								store.load();
								customerForm.resumeEvents();
								mask.hide();
								Ext.getCmp('progressWindow').hide();
							}else {
								mask.hide();
								Ext.MessageBox.alert("保存失败", "请检查操作，附件大小不能超过150M！");
							}
						},
						failure: function(form, action){
							mask.hide();
							Ext.MessageBox.alert("保存失败", "请检查操作，附件大小不能超过150M！");
						}
					});
				}
			}
	    },{
	    	xtype: 'button',
			text: '转征信人员',
			itemId: 'credit ',
			icon: '${request.contextPath}/statics/style/img/action/credit.png',
			id: 'credit',
			handler: function(){
				showWindow.show();
			}
	    },{
	    	xtype: 'button',
			text: '重置',
			itemId: 'reset',
			id: 'reset',
			icon: '${request.contextPath}/statics/style/img/action/reset.png',
			handler: function(){
				this.up('form').getForm().reset();
			}
	    }]
	}],
	getButton: function(name){
		return this.getDockedComponent('tools').child('#' + name);
	},
	listeners: {
		dirtychange: function(form, dirty, eOpts){
			var saveButton = this.getButton('save');
			if(dirty)
				saveButton.enable();
			else
				saveButton.disable();
		},
		validitychange: function(form, valid, eOpts) {
			var saveButton = this.getButton('save');
			if(valid && form.isDirty())
				saveButton.enable();
			else
				saveButton.disable();
		}
	}
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
						field.resetOriginalValue();
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
							if(flow){
								field.setReadOnly(true);
								field.validate();
							}else{
								field.setReadOnly(false);
								field.validate();
							}
							field.resetOriginalValue();
						});
						if(flow) {
							Ext.getCmp('credit').setDisabled(true);
							Ext.getCmp('reset').setDisabled(true);
						}else {
							Ext.getCmp('credit').setDisabled(false);
							Ext.getCmp('reset').setDisabled(false);
						}
					}
				};
			}
			Ext.Ajax.request(config);
		}
	}

};
