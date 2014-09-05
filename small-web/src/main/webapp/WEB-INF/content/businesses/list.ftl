<#include "search.ftl">

var businessStore = Ext.create('Ext.data.Store', {
     model: 'Model.Business',
     proxy: {
		type: 'ajax',
		url: '${request.contextPath}/businesses/list.gson',
		reader: {
			type: 'json',
			root: 'models'
		}
	},
	pageSize: 25,
	autoLoad: true
 });

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

var listgrid = Ext.create('Ext.grid.Panel', {
	header: false,
	region: 'center',
	dockedItems: [{
		xtype: 'pagingtoolbar',
		store: businessStore,
		dock: 'bottom',
		displayInfo: true
	}],
	tbar:[
	/*
	{
		xtype: 'button',
		text: '处理流程',
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
	}
	*/

	],
	columns: [{
		header: 'ID',
		dataIndex: 'id',
	}, {
		header: '客户ID',
		dataIndex: 'customer',
		hidden: true,
		renderer: function(value){
			if(value)
				return value.id;
			else
				return "";
		}
	}, {
		header: '客户',
		dataIndex: 'customer',
		renderer: function(value){
			if(value)
				return value.loanername;
			else
				return "";
		}
	}, {
		header: '信用记录',
		dataIndex: 'credit'
	}, {
		header: '公安记录',
		dataIndex: 'publicorder'
	}, {
		header: '法院记录',
		dataIndex: 'court'
	}, {
		header: '分公司',
		dataIndex: 'branch'
	}, {
		header: '垫款金额',
		dataIndex: 'advances'
	}, {
		xtype: 'xdatecolumn',
		format: 'Y-m-d',	
		header: '垫款 日期',
		dataIndex: 'advancedate'
	}, {
		xtype: 'xdatecolumn',
		format: 'Y-m-d',	
		header: '银行放款日期',
		dataIndex: 'loandate'
	}, {
		header: '保险公司',
		dataIndex: 'insuranceagent'
	}, {
		xtype: 'xdatecolumn',
		format: 'Y-m-d',
		header: '保险起始日期',
		dataIndex: 'insurancestart'
	}, {
		xtype: 'xdatecolumn',
		format: 'Y-m-d',
		header: '保险结束日期',
		dataIndex: 'insuranceend'
	}, {
		header: '证书号',
		dataIndex: 'certificate'
	}, {
		header: '是否抵押',
		dataIndex: 'isimpawn'
	}, {
		header: '是否送杭',
		dataIndex: 'issonghang'
	}, {
		header: '车辆型号',
		dataIndex: 'carmodel'
	}, {
		header: '车辆发动机型号',
		dataIndex: 'carengine'
	}, {
		header: '车架',
		dataIndex: 'carframe'
	},{
		xtype: 'xdatecolumn',
		format: 'Y-m-d',	
		header: '送达日期',
		dataIndex: 'songdayinhangriqi'
	},{
		header: '流程节点',
		dataIndex: 'status'
	}],
	store: businessStore,
	listeners: {
		itemclick: function(view, record, item, index, e, eOpts){
			App.currentId = record.get('id');
			App.getTab("business").setDisabled(false);
			App.getTab("customer").setDisabled(false);
			App.getTab("attachment").setDisabled(false);
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
	layout: 'border',
	items: [searchPanel, listgrid],
	edit: function(){},
	listeners: {
		activate: function() {
			var rec = listgrid.getSelectionModel().getSelection()[0];
			if(!rec)
				App.currentId = 0;
	    }
	}
};