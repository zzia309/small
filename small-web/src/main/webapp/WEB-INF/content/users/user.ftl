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
		allowBlank: false,
		editable: false
	},{
		xtype: 'combo',
		fieldLabel: '性别',
		name: 'gender',
		store: genderStore,
		valueField: 'id',
		displayField: 'value',
		editable: false
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
	}, {
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
	}, {
		fieldLabel: '更新日期',
		xtype: 'xdatefield',
		name: 'updated',
		format: 'Y-m-d H:i:s',
		readOnly: true
	}, {
		fieldLabel: '更新人',
		xtype: 'xcombo',
    	name: 'updatedby',
    	store: userStore,
		triggerAction: 'all',
		selectOnFocus: true,
		editable: false,
		queryMode: 'local',
		valueField: 'id',
		readOnly: true,
		displayField: 'username'
	}],
	buttons:[{
		text: '保存',
		icon: '${request.contextPath}/statics/style/img/action/save.png',
		handler: function(){
			var me = this;
			var form = me.up('form').getForm();
			var id = form.findField('id').getValue();
			userForm.suspendEvents(true);
			if(Ext.isEmpty(id)){
				var url = '${request.contextPath}/users/user.gson';
				form.submit({
					url: url,
					success: function(){
						windows.hide();
						userStore.load();
						userForm.resumeEvents();
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
						userForm.resumeEvents();
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
			var form = userForm.getForm();
			var password = form.findField('password');
			password.setReadOnly(false);
			this.clearData();
		}
	},
	initData: function(){
		var sm = listgrid.getSelectionModel();
		if(sm.hasSelection()){
			var record = sm.getSelection()[0];
			var form = userForm.getForm();
			form.setValues(record.data);
			var password = form.findField('password');
			var fields = form.getFields();
			fields.each(function(field){
				field.resetOriginalValue();
			});
			password.setReadOnly(true);
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
