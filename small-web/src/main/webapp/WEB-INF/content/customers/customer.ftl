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
		name: 'id',
		hidden: true
	}, {
		fieldLabel: '客户姓名',
		name: 'loanername',
		allowBlank: false
	}, {
		fieldLabel: '客户性别',
		name: 'loanersex'
	}, {
		fieldLabel: '客户年龄',
		name: 'loanerage'
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
		fieldLabel: '配偶性别',
		name: 'matesex'
	}, {
		fieldLabel: '配偶年龄',
		name: 'mateage'
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
		fieldLabel: '担保人性别',
		name: 'guaranteesex'
	}, {
		fieldLabel: '担保人年龄',
		name: 'guaranteeage'
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
		name: 'cartype'
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
	anchor: '98.6% 120%',
	dockedItems: [{
	    xtype: 'toolbar',
	    dock: 'bottom',
	    itemId: 'tools',
	    ui: 'footer',
	    items: ['->',{
	    	xtype: 'button',
			text: '保存',
			itemId: 'save',
			disabled: true,
			formBind: true,
			handler: function(){
				var form = this.up('form').getForm();
				if(form.isValid()){
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
							}
						}
					});
				}
			}
	    },{
	    	xtype: 'button',
			text: '重置',
			itemId: 'reset',
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
			console.log(saveButton);
			if(valid && form.isDirty())
				saveButton.enable();
			else
				saveButton.disable();
		}
	}
});

var customerTab = {
	autoScroll: true,
	layout: 'anchor',
	itemId: 'customer',
	title: '担保信息维护',
	items: customerForm,
	listeners: {
		activate: function(){
			var form = customerForm.getForm();
			var config = {
				url: '${request.contextPath}/customers/customer/new.gson',
				method: 'GET',
				callback: function(options, success, response) {
					var values = Ext.decode(response.responseText);
					form.setValues(values);
				}
			};
			if(App.currentId){
				config = {
					url: '${request.contextPath}/customers/customer/' + App.currentId + '.gson',
					success: function(response){
						var values = Ext.decode(response.responseText);
						form.setValues(values);
						var fields = form.getFields();
						fields.each(function(field){
							field.resetOriginalValue();
						});
					}
				};
			}
			Ext.Ajax.request(config);
		}
	}
};
