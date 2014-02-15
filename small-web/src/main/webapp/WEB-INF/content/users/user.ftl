var userForm = Ext.create('Ext.form.Panel', {
	layout: 'column',
	defaultType: 'textfield',
	defaults: {
		columnWidth: 0.5,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items:[{
		name: 'id',
		hidden: true
	},{
		fieldLabel: '用户名',
		name: 'username',
		allowBlank: false
	},{
		fieldLabel: '密码',
		name: 'password',
		inputType: 'password',
		allowBlank: false
	},{
		fieldLabel: '全名',
		name: 'fullname',
		allowBlank: false
	},{
		xtype: 'combo',
		fieldLabel: '角色',
		name: 'priority',
		store: rolestore,
		valueField: 'id',
		displayField: 'value',
		allowBlank: false
	},{
		xtype: 'combo',
		fieldLabel: '性别',
		name: 'gender',
		store: genderStore,
		valueField: 'id',
		displayField: 'value'
	},{
		fieldLabel: '是否停用',
		xtype: 'checkbox',
		name: 'disabled',
		inputValue: true
	},{
		fieldLabel: '地址',
		name: 'address'
	},{
		fieldLabel: '电话',
		name: 'tel'
	}, {
		fieldLabel: '手机',
		name: 'cellphone'
	}, {
		fieldLabel: '邮箱',
		name: 'email'
	},{
		fieldLabel: 'QQ',
		name: 'qq'
	}],
	buttons:[{
		text: '保存',
		icon: '${request.contextPath}/statics/style/img/action/save.png',
		handler: function(){
			var me = this;
			var form = me.up('form').getForm();
			var id = form.findField('id').getValue();
			if(Ext.isEmpty(id)){
				var url = '${request.contextPath}/users/user.gson';
				form.submit({
					url: url,
					success: function(){
						windows.hide();
						userStore.load();
					}
				});
			}else{
				var url = '${request.contextPath}/users/user/'+ id +'.gson';
				form.submit({
					url: url,
					params: {
						method: 'PUT'
					},
					success: function(){
						windows.hide();
						userStore.load();
					}
				});
			}
		}
	},{
		text: '取消',
		handler: function(){
			windows.hide();
		}
	}]


});

var windows = Ext.create('Ext.window.Window', {
	title: '用户资料维护',
	layout: 'fit',
	width: 600,
	height: 400,
	closeAction: 'hide',
	modal: true,
	items:[userForm],
	listeners: {
		beforehide: function(view, eOpts){
			var me = this;
			this.clearData();
		}
	},
	initData: function(){
		var sm = listgrid.getSelectionModel();
		if(sm.hasSelection()){
			var record = sm.getSelection()[0];
			var form = userForm.getForm();
			form.setValues(record.data);
			var fields = form.getFields();
			fields.each(function(field){
				field.resetOriginalValue();
			});
			windows.show();
		}else{
			Ext.Msg.alert('提醒', '请先选择一条记录');
		}

	},
	clearData: function(){
		var form = userForm.getForm();
		var fields = form.getFields();
		fields.each(function(field){
			field.setValue();
			field.resetOriginalValue();
		});
	}
});
