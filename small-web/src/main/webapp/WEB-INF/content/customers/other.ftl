var flowPanel = Ext.create('Ext.panel.Panel',{
	layout: 'fit',
	items: [{
		xtype: 'htmleditor',
		name: 'opinion',
		id: '#opinion'
	}],
	buttons: [{
		text: '确定',
		handler: function(){
			var descr = Ext.getCmp('#opinion').getValue();
			var form = customerForm.getForm();
			customerForm.suspendEvents();
			var mask = new Ext.LoadMask(Ext.getBody(), {
				msg: "正在转征信人员。。。"
			});
			if(form.isValid()){
				var xfilefields =  customerForm.query("[xtype=filefield]");
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
				var url = '${request.contextPath}/customers/customer!createFlow.gson';
				form.submit({
					url: url,
					params: {
						descr: descr
					},
					success: function(form, action){
						var values = action.result;
						if(values.success){
							App.currentId = null;
							App.openTab('list');
							store.load();
							mask.hide();
							showWindow.hide();
						}else {
							mask.hide();
							Ext.MessageBox.alert("转征信失败", "请检查操作，附件大小不能超过150M！");
						}
					},
					failure: function(form, action){
						mask.hide();
						Ext.MessageBox.alert("转征信失败", "请检查操作，附件大小不能超过150M！");
					}
				});
			}
		}
	}, {
		text: ' 取消',
		handler: function(){
			showWindow.hide();
		}
	}]
});

var showWindow = Ext.create('Ext.window.Window', {
	title: '流程意见',
	width: 400,
	height: 250,
	layout: 'fit',
	closeAction: true,
	hidden: true,
	modal: true,
	items: [flowPanel],
	listeners: {
		beforehide: function(){
			var cmp = Ext.getCmp('#opinion');
			cmp.setValue();
		}

	}
});