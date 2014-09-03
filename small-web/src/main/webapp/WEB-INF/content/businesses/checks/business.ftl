function savesuccess(form, action, mask){
	if(action.result.success) {
		App.openTab('list');
		businessStore.load();
		mask.hide();
		form.resumeEvents();
	}else {
		mask.hide();
		Ext.MessageBox.alert("保存失败", "请检查操作，附件大小不能超过150M！");
	}
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
		name: 'loans',
		readOnly: true
	}, {
		xtype:'numberfield',
		fieldLabel: '垫款金额(元)',
		name: 'advances'
	}, {
		fieldLabel: '垫款日期',
		xtype:'xdatefield',
		format:'Y-m-d',
		name: 'advanceDate'
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
		name: 'insuranceAgent'
	}, {
		fieldLabel: '保险起始日期',
		xtype:'xdatefield',
		format:'Y-m-d',
		name: 'insuranceStart'
	}, {
		fieldLabel: '保险结束日期',
		xtype:'xdatefield',
		format:'Y-m-d',
		name: 'insuranceEnd'
	}, {
		fieldLabel: '是否抵押',
		name: 'isImpawn',
		xtype: 'checkbox',
		inputValue: true
	}, {
		fieldLabel: '是否送行',
		name: 'isSongHang',
		xtype: 'checkbox',
		inputValue: true
	}, {
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
	},{
		fieldLabel: '完成时期',
		xtype:'xdatefield',
		format:'Y-m-d H:i:s',
		name: 'finishtime'
	}]
});


var businessForm = Ext.create('Ext.form.Panel', {
	items:[creditPanel,
		feePanel,
		insurancePanel,
		woFlowPanel,
		{
		xtype: 'panel',
		layout: 'column',
		id: 'businessFile',
		margin: '2 0 2 0',
		items: [{
			fieldLabel:'流程意见',
			name:'woflowDescr',
			columnWidth: 1,
			xtype: 'htmleditor'
		},{
	    	xtype: 'button',
	    	columnWidth: 0.09,
	    	text: '添加附件',
	    	disabled: true,
	    	iconCls:'y-action-attachment',
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
	    	columnWidth: 0.8
	    }]
	}],
	layout: 'anchor',
	autoScroll: true,
	init: function(id){

	}
});

var businessTab = {
	autoScroll: true,
	itemId: 'business',
	title: '担保基本信息',
	items: [businessForm],
	edit: function(id){
		var form = businessForm.getForm();
		if(!Ext.isEmpty(id)){
		}else{
		}
	},
	listeners: {
		activate: function(){
			var fieldSet = Ext.getCmp('businessFile');
			fieldSet.query('[addFieldContainer]')[0].removeAll();
			var form = businessForm.getForm();
			var config = {
				url: '${request.contextPath}/businesses/business/new.gson',
				method: 'GET',
				callback: function(options, success, response) {
					var values = Ext.decode(response.responseText);
					var customer = values.customer;
					var loans = form.findField('loans');
					form.setValues(values);
					loans.setValue(customer.carloans);
					woFlowStore.removeAll();
					var fields = form.getFields();
				}
			};
			if(App.currentId){
				config = {
					url: '${request.contextPath}/businesses/business/' + App.currentId + '.gson',
					success: function(response){
						var values = Ext.decode(response.responseText);
						var loans = form.findField('loans');
						var customer = values.customer;
						form.setValues(values);
						loans.setValue(customer.carloans);
						woFlowStore.removeAll();
						woFlowStore.loadRawData(values['woflows']);
						var fields = form.getFields();
						fields.each(function(field){
							field.resetOriginalValue();
						});
					}
				};
			}
			Ext.Ajax.request(config);
		}
	}
};
