var salesPanel = Ext.create('Ext.panel.Panel', {
	title: '业务员业绩',
	columnWidth: .5,
	height: 228,
	header: {
		minHeight: 25,
		maxHeight: 25,
	},
	items: [{
		xtype: 'displayfield',
		fieldLabel: '贷款总数',
		value: 0
	}, {
		xtype: 'displayfield',
		fieldLabel: '贷款总额',
		value: 0
	}],
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