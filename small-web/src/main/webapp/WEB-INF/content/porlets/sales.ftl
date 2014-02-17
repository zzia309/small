var bakupPanel = Ext.create('Ext.form.Panel',{
	method: 'GET',
	columnWidth: 1,
	defaults: {
		labelAlign: 'right',
		xtype: 'textfield'
	},
	items: [{
		fieldLabel: 'FTPIP',
		name: 'hostip',
		allowblank: false
	},{
		fieldLabel: 'FTP用户名',
		name: 'username',
		allowblank: false
	},{
		fieldLabel: 'FTP密码',
		inputType: 'password',
		name: 'password',
		allowblank: false
	}],
	buttons: [{
		text: '数据备份',
		handler: function(){
			var form = this.up('form').getForm();
			var mask = new Ext.LoadMask(Ext.getBody(), {
				msg: "正在备份。。。"
			});
			mask.show();
			if(form.isValid())
				form.submit({
					url: '${request.contextPath}/back-up.gson?isFile=false',
					success: function(form, action) {
						var values = action.result;
						if(values['success']) {
							Ext.Ajax.request({
								url: '${request.contextPath}/back-up.gson',
								method: 'GET',
								params: {
									hostip: values['hostip'],
									username: values['username'],
									password: values['password'],
									isFile: true
								},
								success: function(response) {
									var value = Ext.decode(response.responseText);
									if(value['success']) {
										Ext.MessageBox.alert("提示", "备份成功！");
										mask.hide();
									}
								}
							});
						}
						else {
							Ext.MessageBox.alert("提示", "备份失败！");
							mask.hide();
						}
					},
					failure: function() {
						Ext.MessageBox.alert("提示", "备份失败！");
						mask.hide();
					}
				});
		}
	}],
	listeners: {
		afterrender: function(form) {
			form.down('field[name=hostip]').focus(true);
		}
	}
});
var salesPanel = Ext.create('Ext.panel.Panel', {
	title: '业务员业绩',
	columnWidth: .5,
	height: 228,
	header: {
		minHeight: 25,
		maxHeight: 25,
	},
	layout: 'column',
	items: [{
		xtype: 'displayfield',
		fieldLabel: '贷款总数',
		columnWidth: .5,
		value: 0
	}, {
		xtype: 'displayfield',
		fieldLabel: '贷款总额',
		columnWidth: .5,
		value: 0
	}, bakupPanel],
	listeners: {
		afterrender: function(view, eOpts) {
			view.getHeader().add([{
				xtype: 'textfield',
				emptyText: '业务员名字',
				id: 'searchSale',
			}, {
				xtype: 'button',
				text: '查询',
				handler: function() {
					var value = Ext.getCmp('searchSale').getValue();
					if(!Ext.isEmpty(value)) {
						Ext.Ajax.request({
							url: '${request.contextPath}/stores/sales.gson',
							method: 'GET',
							params: {
								sales: value
							},
							success: function(response) {
								var text = Ext.decode(response.responseText);
								salesPanel.items.items[0].setValue(text['total']);
								salesPanel.items.items[1].setValue(text['sum']);
							}
						});
					}else {
						salesPanel.items.items[0].setValue(0);
						salesPanel.items.items[1].setValue(0);
					}
				}
			}]);
		}
	}
});