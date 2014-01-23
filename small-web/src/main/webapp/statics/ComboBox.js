Ext.define('Eap.form.field.ComboBox',{

	extend: 'Ext.form.field.ComboBox',

	alias: 'widget.xcombo',

	valueProperty: 'id',

	setValue: function(value){
		var me = this;
		if(Ext.isObject(value)){
			this.callParent([value[me.valueProperty]]);
		}else{
			this.callParent(arguments);
		}
	}
});