var creditPanel = Ext.create('Ext.panel.Panel', {
	defaultType: 'textfield',
	anchor: '100% 38%',
	title: '客户信息',
	layout: 'column',
	collapsible: true,
	defaults: {
		columnWidth: 0.5,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items: [{
		name: 'id',
		hidden: true
	},{
		name: 'customer',
		hidden: true
	},{
		fieldLabel: '信用记录',
		name: 'credit',
		columnWidth: 1,
		xtype: 'htmleditor'
	}, {
		fieldLabel: '公安记录',
		name: 'publicorder'
	}, {
		fieldLabel: '法院记录',
		name: 'court'
	}]
});

var feePanel = Ext.create('Ext.panel.Panel', {
	defaultType: 'textfield',
	anchor: '100% 12%',
	title: '财务信息',
	layout: 'column',
	collapsible: true,
	defaults: {
		columnWidth: 0.25,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items: [{
		fieldLabel: '分公司',
		name: 'branch'
	}, {
		fieldLabel: '垫款金额',
		name: 'advances'
	}, {
		fieldLabel: '垫款 日期',
		name: 'advanceDate'
	}, {
		fieldLabel: '银行放款日期',
		name: 'loandate'
	}]
});

var insurancePanel = Ext.create('Ext.panel.Panel', {
	defaultType: 'textfield',
	anchor: '100% 20%',
	title: '客户信息',
	layout: 'column',
	collapsible: true,
	defaults: {
		columnWidth: 0.3333,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items: [ {
		fieldLabel: '保险公司',
		name: 'insuranceAgent'
	}, {
		fieldLabel: '保险起始日期',
		name: 'insuranceStart'
	}, {
		fieldLabel: '保险结束日期',
		name: 'insuranceEnd'
	}, {
		fieldLabel: '证书号',
		name: 'certificate'
	}, {
		fieldLabel: '是否抵押',
		name: 'isImpawn'
	}, {
		fieldLabel: '是否送杭',
		name: 'isSongHang'
	}, {
		fieldLabel: '车辆型号',
		name: 'carmodel'
	}, {
		fieldLabel: '车辆发动机型号',
		name: 'carengine'
	}, {
		fieldLabel: '车架',
		name: 'carframe'
	}]
});


var businessForm = Ext.create('Ext.form.Panel', {
	items:[creditPanel, feePanel, insurancePanel, {
		xtype: 'panel',
		layout: 'column',
		items: [{
	    	xtype: 'button',
	    	columnWidth: 0.09,
	    	text: '添加附件',
	    	handler: function(){
	    		var con = this.up('panel').query('[addFieldContainer]')[0];
	    		con.add({
	    			xtype: 'xfilefield',
	    			itemName: 'businessfiles'
	    		});
	    	}
	    }, {
	    	xtype: 'fieldcontainer',
	    	addFieldContainer: true,
	    	layout: 'anchor',
	    	columnWidth: 0.91
	    }]
	}],
	anchor: '100% 100%',
	layout: 'anchor',
	autoScroll: true,
	init: function(id){

	},
	buttons:[{
		text: 'Save',
		handler: function(){
			var me = this;
			var form = me.up('form').getForm();
			var id = form.findField('id').getValue();
			console.log(id);
			if(Ext.isEmpty(id)){
				var url = '${request.contextPath}/businesses/business.gson';
				form.submit({
					url: url,
					success: function(){
						App.openTab('list');
						businessStore.load();
					}
				});
			}else{
				var url = '${request.contextPath}/businesses/business/'+ id +'.gson';
				form.submit({
					url: url,
					params: {
						_method: 'PUT'
					},
					success: function(){
						App.openTab('list');
						businessStore.load();
					}
				});
			}
		}
	},{
		text: 'Cancel',
		handler: function(){
			windows.hide();
		}
	}]
});

var businessTab = {
	autoScroll: true,
	layout: 'anchor',
	itemId: 'business',
	title: '担保基本信息',
	items: businessForm,
	edit: function(id){
		var form = businessForm.getForm();
		if(!Ext.isEmpty(id)){
		}else{
		}
	}
};