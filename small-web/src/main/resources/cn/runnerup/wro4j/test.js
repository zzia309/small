var uriPanel = Ext.create('Eap.form.Panel', {
	action: '/eap/uris/uri',
	items: [{
		xtype: 'hidden',
		name: 'id',
		hidden: true
    },{
        name: 'uri'
    },{
    	xtype: 'l10ntextfield',
    	name: 'name',
    	model:'uri',
		record: 'id',
		field: 'name'
    },{
    	name: 'icon',
    },{
    	xtype: 'functionField',
    	name: 'function',
    }],
	listeners: {
		dirtychange: function(form, dirty, eOpts) {
			if(dirty) {
				App.getButton('reset').enable();
				if(form.isValid())
					App.getButton('save').enable();
			} else {
				App.getButton('reset').disable();
				App.getButton('save').disable();
			}
		},
		validitychange: function(form, valid, eOpts) {
			if(valid && form.isDirty())
				App.getButton('save').enable();
			else
				App.getButton('save').disable();
		},
		afternew: function(form, values) {
			App.currentId = null;
			App.getButton('delete').disable();
		},
		afterread: function(form, values) {
			App.currentId = values.id;
			App.getButton('delete').enable();
		},
		aftercreate: function(form, values) {
			App.currentId = values.id;
			App.setDirty(true);
			App.getButton('delete').enable();
		},
		afterupdate: function(form, values) {
			App.setDirty(true);
		},
		afterdelete: function(form, values) {
			App.currentId = null;
			App.setDirty(true);
			App.openTab('list');
		},
		canceledit: Eap.form.Panel.cancelListener
	}
});