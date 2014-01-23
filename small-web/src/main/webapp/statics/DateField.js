Ext.define('Eap.form.field.Date', {
	extend: 'Ext.form.field.Date',
	alias: 'widget.xdatefield',

	setValue: function(value) {
		var me = this;
		if(Ext.isNumber(value))
			me.callParent([new Date(value)]);
		else
			me.callParent(arguments);
	},

	// @private
    getSubmitValue: function() {
        value = this.getValue();
        return value ? value.getTime().toString() : '';
    }
});