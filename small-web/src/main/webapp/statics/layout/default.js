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
					window.location = config.path + '/eap/profile/index';
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
