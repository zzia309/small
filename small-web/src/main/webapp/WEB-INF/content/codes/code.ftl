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
var codeForm = Ext.create('Ext.form.Panel', {
	layout: 'column',
	columnWidth: 1,
	defaultType: 'textfield',
	defaults: {
		columnWidth: 0.5,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items:[{
		name: 'id',
		hidden: true
	}, {
		fieldLabel: '类型',
		name: 'type',
		xtype: 'combo',
		store: typeStore,
		valueField: 'code',
		displayField: 'name',
		editable: false,
		allowBlank: false
	}, {
		fieldLabel: '代码',
		name: 'code',
		allowBlank: false,
		listeners: {
			change: function(oldValue, newValue){
				var form = codeForm.getForm();
				form.findField('name').setValue(newValue);
			}
		}
	}, {
		fieldLabel: '显示名称',
		name: 'name',
		allowBlank: false,
		editable: false,
		readOnly: true
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
		displayField: 'username',
		hidden: true
	}],
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
				codeForm.suspendEvents();
				if(form.isValid()){
					var url = '${request.contextPath}/codes/code.gson';
					var params = {};
					if(App.currentId){
						url = '${request.contextPath}/codes/code/'+ App.currentId +'.gson';
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
								codeForm.resumeEvents();
							}
						}
					});
				}
			}
	    }, {
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

var codeTab = {
	layout: 'fit',
	autoScroll: true,
	itemId: 'code',
	title: '基本信息维护',
	items: codeForm,
	listeners: {
		activate: function(){
			var form = codeForm.getForm();
			var config = {
				url: '${request.contextPath}/codes/code/new.gson',
				method: 'GET',
				callback: function(options, success, response) {
					var values = Ext.decode(response.responseText);
					form.setValues(values);
				}
			};
			if(App.currentId){
				config = {
					url: '${request.contextPath}/codes/code/' + App.currentId + '.gson',
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

