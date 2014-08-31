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
	}else {
		mask.hide();
		Ext.MessageBox.alert("保存失败", "请检查操作，附件大小不能超过150M！");
	}
}

function loadState(businessForm, mask) {
	var xfilefields = businessForm.query("[xtype=filefield]");
	var st = false;
	if(xfilefields.length>0) {
		Ext.Array.forEach(xfilefields, function(fileField) {
			if(fileField.getValue()) {
				st = true;
			}
		});
	}
	if(st) {
		progressWindow.show();
		fileInterVal = setInterval(interVal, 300);
	}else
		mask.show();
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
		<#if action.user?? && action.user.priority==2>
			readOnly: false
		<#else>
			readOnly: true
		</#if>
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
		<#if action.user?? && action.user.priority==6>
			readOnly: false
		<#else>
			readOnly: true
		</#if>
	},
	items: [{
		fieldLabel: '贷款金额',
		name: 'loans'
	}, {
		xtype:'numberfield',
		fieldLabel: '垫款金额',
		name: 'advances'
	}, {
		fieldLabel: '公司垫款日期',
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
		fieldLabel: '银行放款金额',
		name: 'amounts'
	}, {
		fieldLabel: '银行放款日期',
		xtype:'xdatefield',
		format:'Y-m-d',
		name: 'loandate'
	},{
		fieldLabel: '本单毛利',
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
		<#if action.user?? && action.user.priority==7>
			readOnly: false
		<#else>
			readOnly: true
		</#if>
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
	}]
});

var businessForm = Ext.create('Ext.form.Panel', {
	items:[creditPanel,
		<#if action.user?? && (action.user.priority>5)>
		feePanel,
		</#if>
		<#if action.user?? && (action.user.priority>6)>
		insurancePanel,
		</#if>
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

	},
	buttons:[{
		text: '驳回',
		icon: '${request.contextPath}/statics/style/img/action/reject.png',
		handler: function(){
			var me = this;
			var form = this.up('form').getForm();
			var id = form.findField('id').getValue();
			if(Ext.isEmpty(id)){
			}else{
				var url = '${request.contextPath}/businesses/business/'+ id +'.gson';
				form.submit({
					url: url,
					params: {
						_method: 'PUT',
						newStatus: '-'
					},
					success: function(){
						App.openTab('list');
						businessStore.load();
					}
				});
			}
		}
	}, {
		text: '转初审',
		hidden:<#if action.user?? && (action.user.priority=2)>
			false
			<#else>
			true
		</#if>,
		icon: '${request.contextPath}/statics/style/img/action/first.png',
		handler: function(){
			var me = this;
			var form = businessForm.getForm();
			var id = form.findField('id').getValue();
			businessForm.suspendEvents();
			var mask = new Ext.LoadMask(Ext.getBody(), {
				msg: "正在转初审。。。"
			});
			if(Ext.isEmpty(id)){
			}else{
				loadState(businessForm, mask);
				var url = '${request.contextPath}/businesses/business/'+ id +'.gson';
				form.submit({
					url: url,
					params: {
						_method: 'PUT',
						newStatus: 'trial'
					},
					success: function(form, action){
						savesuccess(form, action, mask);
					},
					failure: function(form, action){
						mask.hide();
						Ext.MessageBox.alert("保存失败", "请检查操作，附件大小不能超过150M！");
					}
				});
			}
		}
	},{
		text: '转终审',
		icon: '${request.contextPath}/statics/style/img/action/final.png',
		hidden:<#if action.user?? && (action.user.priority=3)>
			false
			<#else>
			true
		</#if>,
		handler: function(){
			var me = this;
			var form = me.up('form').getForm();
			var id = form.findField('id').getValue();
			businessForm.suspendEvents();
			var mask = new Ext.LoadMask(Ext.getBody(), {
				msg: "正在转终审。。。"
			});
			if(Ext.isEmpty(id)){
			}else{
				loadState(businessForm, mask);
				var url = '${request.contextPath}/businesses/business/'+ id +'.gson';
				form.submit({
					url: url,
					params: {
						_method: 'PUT',
						newStatus: 'final'
					},
					success: function(form, action){
						savesuccess(form, action, mask);
					},
					failure: function(form, action){
						mask.hide();
						Ext.MessageBox.alert("保存失败", "请检查操作，附件大小不能超过150M！");
					}
				});
			}
		}
	},{
		text: '转老板过件',
		icon: '${request.contextPath}/statics/style/img/action/boss.png',
		hidden:<#if action.user?? && (action.user.priority=4)>
			false
			<#else>
			true
		</#if>,
		handler: function(){
			var me = this;
			var form = me.up('form').getForm();
			var id = form.findField('id').getValue();
			businessForm.suspendEvents();
			var mask = new Ext.LoadMask(Ext.getBody(), {
				msg: "正在转老板过件。。。"
			});
			if(Ext.isEmpty(id)){
			}else{
				loadState(businessForm, mask);
				var url = '${request.contextPath}/businesses/business/'+ id +'.gson';
				form.submit({
					url: url,
					params: {
						_method: 'PUT',
						newStatus: 'boss'
					},
					success: function(form, action){
						savesuccess(form, action, mask);
					},
					failure: function(form, action){
						mask.hide();
						Ext.MessageBox.alert("保存失败", "请检查操作，附件大小不能超过150M！");
					}
				});
			}
		}
	},{
		text: '转财务',
		icon: '${request.contextPath}/statics/style/img/action/cash.png',
		hidden:<#if action.user?? && (action.user.priority=5)>
			false
			<#else>
			true
		</#if>,
		handler: function(){
			var me = this;
			var form = me.up('form').getForm();
			var id = form.findField('id').getValue();
			businessForm.suspendEvents();
			var mask = new Ext.LoadMask(Ext.getBody(), {
				msg: "正在转财务。。。"
			});
			if(Ext.isEmpty(id)){
			}else{
				loadState(businessForm, mask);
				var url = '${request.contextPath}/businesses/business/'+ id +'.gson';
				form.submit({
					url: url,
					params: {
						_method: 'PUT',
						newStatus: 'finance'
					},
					success: function(form, action){
						savesuccess(form, action, mask);
					},
					failure: function(form, action){
						mask.hide();
						Ext.MessageBox.alert("保存失败", "请检查操作，附件大小不能超过150M！");
					}
				});
			}
		}
	},{
		text: '转后勤',
		icon: '${request.contextPath}/statics/style/img/action/workback.png',
		hidden:<#if action.user?? && (action.user.priority=6)>
			false
			<#else>
			true
		</#if>,
		handler: function(){
			var me = this;
			var form = me.up('form').getForm();
			var id = form.findField('id').getValue();
			var mask = new Ext.LoadMask(Ext.getBody(), {
				msg: "正在转后勤。。。"
			});
			if(Ext.isEmpty(id)){
			}else{
				loadState(businessForm, mask);
				var url = '${request.contextPath}/businesses/business/'+ id +'.gson';
				form.submit({
					url: url,
					params: {
						_method: 'PUT',
						newStatus: 'logistics'
					},
					success: function(form, action){
						savesuccess(form, action, mask);
					},
					failure: function(form, action){
						mask.hide();
						Ext.MessageBox.alert("保存失败", "请检查操作，附件大小不能超过150M！");
					}
				});
			}
		}
	},{
		text: '关闭',
		icon: '${request.contextPath}/statics/style/img/action/close.png',
		hidden:
		<#if action.user?? && (action.user.priority=7)>
			false
			<#else>
			true
		</#if>,
		handler: function(){
			var me = this;
			var form = me.up('form').getForm();
			var id = form.findField('id').getValue();
			if(Ext.isEmpty(id)){
			}else{
				var url = '${request.contextPath}/businesses/business/'+ id +'.gson';
				form.submit({
					url: url,
					params: {
						_method: 'PUT',
						newStatus: 'closed'
					},
					success: function(){
						App.openTab('list');
						businessStore.load();
					}
				});
			}
		}
	}]
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
					form.setValues(values);
					<#if action.user?? && (action.user.priority>5)>
						var loan = form.findField('loans');
						var customer = values.customer;
						loan.setValue(customer.carloans);
					</#if>
					woFlowStore.removeAll();
					var fields = form.getFields();
					fields.each(function(field){
						field.setReadOnly(false);
						field.validate();
					});
				}
			};
			if(App.currentId){
				config = {
					url: '${request.contextPath}/businesses/business/' + App.currentId + '.gson',
					success: function(response){
						var values = Ext.decode(response.responseText);
						form.setValues(values);
						<#if action.user?? && (action.user.priority>5)>
							var loan = form.findField('loans');
							var customer = values.customer;
							loan.setValue(customer.carloans);
						</#if>
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
