Ext.define('Itsm.FileField',{
	extend: 'Ext.form.FieldContainer',
	alias: 'widget.xfilefield',
	buttonText: {
		cancel: 'Cancel'
	},
	constructor: function(config){
		var me = this;
		me.anchor = '100%';
		me.config = config || {};
		config.layout = 'column';
		config.items = [{
			xtype: 'filefield',
			columnWidth: 0.89,
			name : config.itemName
		},{
			xtype: 'button',
			text: me.buttonText.cancel,
			width: 65,
			margin: '0 2 0 2',
			handler: function(){
				var me = this;
				var con = me.up('fieldcontainer');
				me.up('panel').query('[addFieldContainer]')[0].remove(con);
			}
		}];
		this.callParent([config]);
	}
});