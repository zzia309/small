Ext.define('Eap.grid.column.Date', {
    extend: 'Ext.grid.column.Date',
    alias: ['widget.xdatecolumn'],

    initComponent: function(){
        var me = this;

        me.callParent(arguments);
        me.renderer = function(value) {
			if(value != null && value !== '') {
				return Ext.Date.format(new Date(value), me.format);
			} else {
				return '';
			}
        };
    }
});
