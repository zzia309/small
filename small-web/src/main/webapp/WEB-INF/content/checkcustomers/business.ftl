var customerStore = Ext.create('Ext.data.Store', {
	 fields: ['id', 'loanername'],
     proxy: {
		type: 'ajax',
		url: '${request.contextPath}/stores/customer-store.gson',
		reader: {
			type: 'json',
			root: 'model'
		}
	},
	autoLoad: true
 });
var userStore = Ext.create('Ext.data.Store', {
	 fields: ['id', 'username'],
     proxy: {
		type: 'ajax',
		url: '${request.contextPath}/stores/user-store.gson',
		reader: {
			type: 'json',
			root: 'model'
		}
	},
	autoLoad: true
 });
function savesuccess(form, action, mask){
	if(action.result.success) {
		App.openTab('list');
		businessStore.load();
		mask.hide();
		form.resumeEvents();
		Ext.getCmp('progressWindow').hide();
	}else {
		mask.hide();
		Ext.MessageBox.alert("保存失败", "请检查操作，附件大小不能超过150M！");
	}
	Ext.getCmp('progressbar').reset();
	Ext.getCmp('progressWindow').hide();
}

var creditPanel = Ext.create('Ext.panel.Panel', {
	title: '征信信息',
	layout: 'column',
	collapsible: true,
	height: 210,
	region: 'center',
	defaults: {
		labelAlign: 'right',
		xtype: 'textfield',
		margin: '2 0 2 0',
		readOnly: true
	},
	items: [{
		name: 'id',
		hidden: true
	}, {
		fieldLabel: '客户',
		xtype: 'xcombo',
    	name: 'customer',
    	store: customerStore,
		triggerAction: 'all',
		selectOnFocus: true,
		editable: false,
		queryMode: 'local',
		valueField: 'id',
		hidden: true,
		displayField: 'loanername'
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
		name: 'publicorder',
		columnWidth: 0.5
	}, {
		fieldLabel: '法院记录',
		columnWidth: 0.5,
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
		margin: '2 0 2 0',
		readOnly: true
	},
	items: [{
		fieldLabel: '贷款金额(元)',
		name: 'loans'
	}, {
		xtype:'numberfield',
		fieldLabel: '垫款金额(元)',
		name: 'advances'
	}, {
		fieldLabel: '公司垫款日期',
		xtype:'xdatefield',
		format:'Y-m-d',
		name: 'advancedate'
	}, {
		fieldLabel: '垫款银行',
		name: 'advancebank',
		xtype: 'combo',
		store: bankStore,
		valueField: 'code',
		displayField: 'name',
		editable: false
	}, {
		xtype:'numberfield',
		fieldLabel: '银行放款金额(元)',
		name: 'amounts'
	}, {
		fieldLabel: '银行放款日期',
		xtype:'xdatefield',
		format:'Y-m-d',
		name: 'loandate'
	},{
		fieldLabel: '本单毛利(元)',
		name: 'profits'
	}]
});

var insurancePanel = Ext.create('Ext.panel.Panel', {
	defaultType: 'textfield',
	anchor: '100% 25%',
	title: '后勤处理',
	layout: 'column',
	collapsible: true,
	defaults: {
		columnWidth: 0.3333,
		labelAlign: 'right',
		margin: '2 0 2 0',
		readOnly: true
	},
	items: [ {
		fieldLabel: '保险公司',
		name: 'insuranceagent'
	}, {
		fieldLabel: '保险起始日期',
		xtype:'xdatefield',
		format:'Y-m-d',
		name: 'insurancestart'
	}, {
		fieldLabel: '保险结束日期',
		xtype:'xdatefield',
		format:'Y-m-d',
		name: 'insuranceend'
	}, {
		fieldLabel: '是否抵押',
		name: 'isimpawn',
		xtype: 'checkbox',
		inputValue: true
	}, {
		fieldLabel: '是否送行',
		name: 'issonghang',
		xtype: 'checkbox',
		inputValue: true
	}, {
		fieldLabel: '送达银行日期',
		xtype:'xdatefield',
		format:'Y-m-d',
		name: 'songdayinhangriqi'
	},{
		fieldLabel: '证书号',
		name: 'certificate'
	}, {
		fieldLabel: '车辆型号',
		name: 'carmodel'
	}, {
		fieldLabel: '车辆发动机型号',
		name: 'carengine'
	}, {
		fieldLabel: '车架号',
		name: 'carframe'
	}, {
		fieldLabel: '车牌',
		name: 'carno'
	}]
});



var businessForm = Ext.create('Ext.form.Panel', {
	items:[creditPanel,
		feePanel,
		insurancePanel,
		woFlowPanel
	],
	layout: 'anchor',
	autoScroll: true
});

var businessTab = {
	autoScroll: true,
	itemId: 'business',
	title: '担保基本信息',
	items: [businessForm],
	listeners: {
		activate: function(){
			Ext.Ajax.request({
				url: '${request.contextPath}/checkcustomers/customer/' + App.currentId + '.gson',
				success: function(response){
					var values = Ext.decode(response.responseText);
					var form = businessForm.getForm();
					form.setValues(values);
					var fields = form.getFields();
					fields.each(function(field){
						field.setReadOnly(true);
						field.validate();
						field.resetOriginalValue();
					});
				}
			});
		}
	}
};
