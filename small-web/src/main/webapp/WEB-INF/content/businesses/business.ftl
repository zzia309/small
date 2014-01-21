var lenderPanel = Ext.create('Ext.panel.Panel', {
	defaultType: 'textfield',
	anchor: '100% 13.5%',
	title: '客户信息',
	layout: 'column',
	collapsible: true,
	defaults: {
		columnWidth: 0.3333,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items:[{
		name: 'id',
		hidden: true
	},{
		fieldLabel: '姓名',
		name: 'lendername'
	},{
		fieldLabel: '性别',
		name: 'lendersex'
	},{
		fieldLabel: '年龄',
		name: 'lenderage'
	},{
		fieldLabel: '身份证',
		name: 'lendercard'
	},{
		fieldLabel: '电话',
		name: 'lendertel'
	},{
		fieldLabel: '单位名称',
		name: 'lenderunit'
	},{
		fieldLabel: '单位电话',
		name: 'lenderunittel'
	},{
		fieldLabel: '房产信息',
		name: 'lenderestate'
	},{
		fieldLabel: '所在地区',
		name: 'lenderarea'
	}]
});

var matePanel = Ext.create('Ext.panel.Panel', {
	defaultType: 'textfield',
	anchor: '100% 13.5%',
	collapsible: true,
	title: '配偶信息',
	layout: 'column',
	defaults: {
		columnWidth: 0.3333,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items:[{
		fieldLabel: '姓名',
		name: 'matename'
	},{
		fieldLabel: '性别',
		name: 'matesex'
	},{
		fieldLabel: '年龄',
		name: 'mateage'
	},{
		fieldLabel: '身份证',
		name: 'matecard'
	},{
		fieldLabel: '电话',
		name: 'matetel'
	},{
		fieldLabel: '房产信息',
		name: 'mateestate'
	},{
		fieldLabel: '单位名称',
		name: 'mateunit'
	},{
		fieldLabel: '单位电话',
		name: 'mateunittel'
	},{
		fieldLabel: '所在地区',
		name: 'matearea'
	}]
});


var guaranteePanel = Ext.create('Ext.panel.Panel', {
	defaultType: 'textfield',
	title: '担保人信息',
	layout: 'column',
	collapsible: true,
	anchor: '100% 13.5%',
	defaults: {
		columnWidth: 0.3333,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items:[{
		fieldLabel: '姓名',
		name: 'guaranteename'
	},{
		fieldLabel: '性别',
		name: 'guaranteesex'
	},{
		fieldLabel: '年龄',
		name: 'guaranteeage'
	},{
		fieldLabel: '身份证',
		name: 'guaranteecard'
	},{
		fieldLabel: '电话',
		name: 'guaranteetel'
	},{
		fieldLabel: '房产信息',
		name: 'guaranteeEstate'
	},{
		fieldLabel: '单位名称',
		name: 'guaranteeunit'
	},{
		fieldLabel: '单位电话',
		name: 'guaranteeunittel'
	},{
		fieldLabel: '所在地区',
		name: 'guaranteearea'
	}]
});

var carPanel = Ext.create('Ext.panel.Panel', {
	defaultType: 'textfield',
	title: '车辆及销售信息',
	collapsible: true,
	anchor: '100% 10.5%',
	layout: 'column',
	defaults: {
		columnWidth: 0.25,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items:[{
		fieldLabel: '业务员',
		name: 'sales'
	},{
		fieldLabel: '区域经理',
		name: 'manager'
	},{
		fieldLabel: '车辆类型',
		name: 'carType'
	},{
		fieldLabel: '年限',
		name: 'years'
	},{
		fieldLabel: '保证金',
		name: 'bail'
	},{
		fieldLabel: '公证费',
		name: 'notaryFee'
	},{
		fieldLabel: '担保费',
		name: 'guaranteeFees'
	},{
		fieldLabel: '其他费用',
		name: 'otherFee'
	}]
});

var creditPanel = Ext.create('Ext.panel.Panel', {
	defaultType: 'textfield',
	collapsible: true,
	anchor: '100% 18%',
	title: '车辆及销售信息',
	layout: 'column',
	items:[{
		xtype: 'htmleditor',
		columnWidth: 1,
        enableColors: false,
        enableAlignments: false,
        name: 'credit'
	}]
});

var advancePanel = Ext.create('Ext.panel.Panel', {
	defaultType: 'textfield',
	collapsible: true,
	title: '垫款信息',
	anchor: '100% 7%',
	layout: 'column',
	defaults: {
		columnWidth: 0.333,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items:[{
		fieldLabel: '分公司',
		name: 'branch'
	},{
		fieldLabel: '垫款金额',
		name: 'advances'
	},{
		fieldLabel: '垫款日期',
		name: 'advanceDate'
	}]
});

var otherPanel = Ext.create('Ext.panel.Panel', {
	defaultType: 'textfield',
	title: '后勤信息',
	collapsible: true,
	layout: 'column',
	anchor: '100% 10%',
	defaults: {
		columnWidth: 0.333,
		labelAlign: 'right',
		margin: '2 0 0 0'
	},
	items:[{
		fieldLabel: '保险公司公司',
		name: 'insuranceagent'
	},{
		fieldLabel: '保险起始日期',
		name: 'insuranceStart'
	},{
		fieldLabel: '保险结束日期',
		name: 'insuranceEnd'
	},{
		fieldLabel: '登记证书号',
		name: 'certificate'
	}, {
		fieldLabel: '是否抵押',
		name: 'isImpawn'
	}, {
		fieldLabel: '是否送杭',
		name: 'isSongHang'
	}]
});



var businessForm = Ext.create('Ext.form.Panel', {
	items:[lenderPanel, matePanel, guaranteePanel, carPanel, creditPanel, advancePanel, otherPanel],
	anchor: '98.6% 140%',
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
	title: '担保信息维护',
	items: businessForm,
	edit: function(id){
		var form = businessForm.getForm();
		if(!Ext.isEmpty(id)){
		}else{
		}
	}
};