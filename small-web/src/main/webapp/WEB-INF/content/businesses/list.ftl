var businessStore = Ext.create('Ext.data.Store', {
     model: 'Model.Business',
     proxy: {
		type: 'ajax',
		url: '${request.contextPath}/businesses/list.gson',
		reader: {
			type: 'json',
			root: 'model'
		}
	},
	autoLoad: true
 });


var listgrid = Ext.create('Ext.grid.Panel', {
	header: false,
	tbar:[{
		xtype: 'button',
		text: '新增客户信息',
		handler: function(){
			App.currentId = null;
			var tab = App.getTab('business');
			var form = tab.down('form').getForm();
			Ext.Ajax.request({
				url: '${request.contextPath}/businesses/business/new.gson',
				method: 'GET',
				callback: function(options, success, response) {
					var values = Ext.decode(response.responseText);
					form.setValues(values);
				}
			});
			App.openTab('business', App.currentId);
		}
	},{
		xtype: 'button',
		text: '修改客户资料',
		handler: function(){
			var tab = App.getTab('business');
			var form = tab.down('form').getForm();
			Ext.Ajax.request({
				url: '${request.contextPath}/businesses/business/' + App.currentId + '.gson',
				success: function(response){
					var values = Ext.decode(response.responseText);
					form.setValues(values);
					var fields = form.getFields();
					fields.each(function(field){
						field.resetOriginalValue();
					});
				}
			});
			App.openTab('business', App.currentId);
		}
	}],
	columns: [{
		header: 'ID',
		dataIndex: 'id',
	},{
		header: '客户名称',
		dataIndex: 'lendername'
	},{
		header: '客户性别',
		dataIndex: 'lendersex'
	},{
		header: '客户年龄',
		dataIndex: 'lenderage'
	},{
		header: '客户身份证',
		dataIndex: 'lendercard'
	},{
		header: '客户电话',
		dataIndex: 'lendertel'
	},{
		header: '客户房产信息',
		dataIndex: 'lenderestate'
	},{
		header: '客户单位名称',
		dataIndex: 'lenderunit'
	},{
		header: '客户单位电话',
		dataIndex: 'lenderunittel'
	},{
		header: '客户所在地区',
		dataIndex: 'lenderarea'
	},{
		header: '配偶名称',
		dataIndex: 'matename'
	},{
		header: '配偶性别',
		dataIndex: 'matesex'
	},{
		header: '配偶年龄',
		dataIndex: 'mateage'
	},{
		header: '配偶身份证',
		dataIndex: 'matecard'
	},{
		header: '配偶电话',
		dataIndex: 'matetel'
	},{
		header: '配偶房产信息',
		dataIndex: 'mateestate'
	},{
		header: '配偶单位名称',
		dataIndex: 'mateunit'
	},{
		header: '配偶单位电话',
		dataIndex: 'mateunittel'
	},{
		header: '配偶所在地区',
		dataIndex: 'matearea'
	},{
		header: '担保人名称',
		dataIndex: 'guarantename'
	},{
		header: '担保人性别',
		dataIndex: 'guaranteesex'
	},{
		header: '担保人年龄',
		dataIndex: 'guaranteeage'
	},{
		header: '担保人身份证',
		dataIndex: 'guaranteecard'
	},{
		header: '担保人电话',
		dataIndex: 'guaranteetel'
	},{
		header: '担保人房产信息',
		dataIndex: 'guaranteeestate'
	},{
		header: '担保人单位名称',
		dataIndex: 'guaranteeunit'
	},{
		header: '担保人单位电话',
		dataIndex: 'guaranteeunittel'
	},{
		header: '担保人所在地区',
		dataIndex: 'guaranteearea'
	},{
		header: '业务员',
		dataIndex: 'sales'
	},{
		header: '区域经理',
		dataIndex: 'manager'
	},{
		header: '车辆类型',
		dataIndex: 'carType'
	},{
		header: '年限',
		dataIndex: 'years'
	},{
		header: '保证金',
		dataIndex: 'bail'
	},{
		header: '公证费',
		dataIndex: 'notaryFee'
	},{
		header: '担保费',
		dataIndex: 'guaranteeFees'
	},{
		header: '其他费用',
		dataIndex: 'otherFee'
	},{
		header: '信用记录',
		dataIndex: 'credit'
	},{
		header: '分公司',
		dataIndex: 'branch'
	},{
		header: '垫款金额',
		dataIndex: 'advances'
	},{
		header: '垫款 日期',
		dataIndex: 'advanceDate'
	},{
		header: '保险公司',
		dataIndex: 'insuranceAgent'
	},{
		header: '保险起始日期',
		dataIndex: 'insuranceStart'
	},{
		header: '保险结束日期',
		dataIndex: 'insuranceEnd'
	},{
		header: '证书号',
		dataIndex: 'certificate'
	},{
		header: '是否抵押',
		dataIndex: 'isImpawn'
	},{
		header: '是否送杭',
		dataIndex: 'isSongHang'
	},{
		header: '流程节点',
		dataIndex: 'status'
	}],
	store: businessStore,
	listeners: {
		itemclick: function(view, record, item, index, e, eOpts){
			App.currentId = record.get('id');
		},
		itemdblclick: function(view, record, item, index, e, eOpts){
			var tab = App.getTab('business');
			var form = tab.down('form').getForm();
			Ext.Ajax.request({
				url: '${request.contextPath}/businesses/business/' + App.currentId + '.gson',
				success: function(response){
					var values = Ext.decode(response.responseText);
					form.setValues(values);
					var fields = form.getFields();
					fields.each(function(field){
						field.resetOriginalValue();
					});
				}
			});
			App.openTab('business', App.currentId);
		}
	}
});

var listTab = {
	itemId: 'list',
	title: '列表',
	layout: 'fit',
	items: listgrid,
	edit: function(){},
	listeners: {
		activate: function() {
	    }
	}
};