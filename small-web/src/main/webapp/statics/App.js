Ext.define('App', {
	singleton: true,
	menuTitle: 'Menu',
	leaveMessage: 'Leave this page will lose your unsaved data!',
	editTab: '',
	idProperty: 'id',
	currentId: null,
	dirty: false,
	init: function(config) {
		var me = this;
		Ext.apply(this, config);
		Ext.EventManager.on(window, 'beforeunload', me.onBeforeUnload, this);
	},

	createContentPanel: function(config) {
		config = config || {};
		return Ext.create('Ext.tab.Panel', {
			id: 'mainContent',
			plain: false,
			items: config.tabs || []
		});
	},

	getContentPanel: function() {
		return Ext.getCmp('mainContent');
	},
	getTab: function(tab) {
		if(Ext.isEmpty(tab)) return this.getContentPanel().getActiveTab();
		else return this.getContentPanel().child('#' + tab);
	},

	// private
	onBeforeUnload: function(e) {
		var me = this;
		var panel = me.getActionPanel(me.getTab());
		if(Ext.isFunction(panel.isDirty)) {
			if(panel.isDirty()) {
				e.browserEvent.returnValue = me.leaveMessage;
			}
		}
	},

	openTab: function(tab, id, params){
		var panel = this.getContentPanel();
		var card = this.getTab(tab);
		if(card != null) {
			panel.suspendEvents();
			if(!card.active)
				panel.setActiveTab(card);
			panel.resumeEvents();
		}
	}
});
