Ext.define('Eap.layout.Default', {
	singleton: true,

	menuTitle: '菜单',//or menu

	welcomeText: '欢迎你, {0} ',//Welcome {0}

	tooltips: {
		expand: 'Expand',
		collapse: 'Collpase',
		home: '首页',
		profile: '个人设置',
		exit: '退出'
	},

	getMenuTree: function(store){
		return Ext.create('Ext.tree.Panel', {
		    header: false,
		    store: store,
		    rootVisible: false,
		    listeners: {
		    	itemclick: function(view,record){
					if(record.get('leaf')){
						var uri = record.raw.uri;
						if(!Ext.isEmpty(uri))
							window.location = uri;
					}
				}
		    }
		});
	},
	createMenu: function(config) {
		var me = this;
		store = config.store || {};
		var treepanel = this.getMenuTree(store);
		var menu = Ext.create('Ext.panel.Panel', {
			id : 'mainMenu',
			region:'west',
			title: me.menuTitle,
			split: true,
			collapsible: true,
			width: 150,
			minWidth: 50,
			maxWidth: 300,
			stateful: true,
			layout: 'fit',
			items: treepanel
		});
		return menu;
	},

	createBanner: function(config) {
		config = config || {};
		var me = this;
		var banner = Ext.create('Ext.toolbar.Toolbar', {
			width: '100%',
			height: 48,
			id: 'banner',
			region:'north',
			border: false,
			items: ['->',{
				xtype: 'tbtext',
				text: Ext.String.format(me.welcomeText, config.username),
				cls: 'my-text'
			},
			'-',
			{
				iconCls: 'y-action-profile',
				text: me.tooltips.profile,
				icon: config.path+'/statics/style/img/action/setting.png',
				cls: 'my-btn',
				handler: function() {
					var gStore = Ext.create('Ext.data.Store', {
						fields: ['id', 'value'],
						data:[{
							'id': 'M', 'value': '男'
						},{
							'id': 'G', 'value': '女'
						}]
					});
					var settingForm = Ext.create('Ext.form.Panel', {
						layout: 'column',
						defaultType: 'textfield',
						defaults: {
							columnWidth: 0.5,
							labelAlign: 'right',
							margin: '2 0 0 0'
						},
						items:[{
							fieldLabel: '用户名',
							name: 'username',
							allowBlank: false
						},{
							fieldLabel: '密码',
							name: 'changepassword',
							inputType: 'password'
						},{
							fieldLabel: '全名',
							name: 'fullname',
							allowBlank: false
						},{
							xtype: 'combo',
							fieldLabel: '性别',
							name: 'gender',
							store: gStore,
							valueField: 'id',
							displayField: 'value'
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
							text: '更新',
							icon: config.path+'/statics/style/img/action/save.png',
							handler: function(){
								var me = this;
								var form = me.up('form').getForm();
								var url =  config.path+'/users/setting/'+ config.id +'.gson';
								form.submit({
									url: url,
									params: {
										_method: 'PUT'
									},
									success: function(){
										settingwindows.close();
									}
								});
							}
						},{
							text: '取消',
							handler: function(){
								settingwindows.close();
							}
						}]
					});

					var settingwindows = Ext.create('Ext.window.Window', {
						title: '用户资料维护',
						layout: 'fit',
						width: 600,
						height: 400,
						closeAction: 'destory',
						modal: true,
						items:[settingForm],
						listeners: {
							beforeshow: function(view, eOpts){
								Ext.Ajax.request({
									url: config.path+'/users/user/'+ config.id +'.gson',
									success: function(response) {
										var value = Ext.decode(response.responseText);
										var form = settingForm.getForm();
										form.setValues(value);
										var fields = form.getFields();
										fields.each(function(field){
											field.resetOriginalValue();
										});
									}
								});
							}
						}
					});
					
					settingwindows.show();
				}
			},
			'-',
			{
				iconCls: 'y-action-home',
				text: me.tooltips.home,
				icon: config.path+'/statics/style/img/action/home.png',
				cls: 'my-btn',
				handler: function() {
					window.location = config.path + '/index';
				}
			},
			'-',
			{
				iconCls: 'y-action-exit',
				text: me.tooltips.exit,
				icon: config.path+'/statics/style/img/action/exit.png',
				cls: 'my-btn',
				handler: function() {
					window.location = config.path+'/logout';
				}
			}]
		});
		return banner;
	},

	layout: function() {
		var content = Ext.getCmp('mainContent');
		if(content == null)
			content = {
				id: 'mainContent',
				html: ''
			};
		Ext.create('Ext.Viewport', {
			layout:'border',
			stateful: true,
			padding: 3,
				items: [Ext.getCmp('mainMenu'), {
				region:'center',
				border: false,
				layout: 'fit',
				items: content
			}, Ext.getCmp('banner')]
		});
	}

});