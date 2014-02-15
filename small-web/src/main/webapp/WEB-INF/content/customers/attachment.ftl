var attachmentStore = Ext.create('Ext.data.Store', {
	fields: ['id', 'filename', 'mime', 'user', 'created', 'size'],
	autoLoad: false
});

var attachmentGrid = Ext.create('Ext.grid.Panel',{
	height: 200,
	autoScroll: true,
	title: '附件列表',
	region: 'north',
	store: attachmentStore,
	columns: [{
		dataIndex: 'id',
		hidden: true
	},{
		text: '文件名',
		dataIndex: 'filename',
		flex: 1
	},{
		text: '文件类型',
		dataIndex: 'mime',
		flex: 1
	},{
		text: '文件大小',
		dataIndex: 'size',
		flex: 1,
		renderer: function(value){
			if(value){
				var result;
				if(value>=1024*1024) {
					result = value/(1024*1024).toFixed(2)+'M';
				}else if(value>=1024) {
					result = value/1024+'k';
				}else
					result = value+'B';
				return result;
			}
			return value;
		}
	},{
		xtype: 'xdatecolumn',
		text: '上传时间',
		dataIndex: 'created',
		format: 'Y-m-d H:i:s',
		flex: 1
	},{
		text: '上传用户',
		dataIndex: 'user',
		flex: 1,
		renderer: function(value) {
			if(value) {
				return value.fullname;
			}
		}
	},{
		xtype:'actioncolumn',
		header: '下载',
        width:80,
        items: [{
        	icon: '${request.contextPath}/statics/style/img/action/download.png',
            tooltip: '下载',
            handler: function(grid, rowIndex, colIndex) {
            	var record = grid.store.getAt(rowIndex);
            	window.location = '${request.contextPath}/commons/down/' + record.get('id');
            }
        }]
	},{
		xtype:'actioncolumn',
        width:50,
        items: [{
        	icon: '${request.contextPath}/statics/style/img/action/delete.png',
            tooltip: '删除',
            handler: function(grid, rowIndex, colIndex) {
            	var record = grid.store.getAt(rowIndex);
            	var id = record.get('id');
            	Ext.Ajax.request({
            		url: '${request.contextPath}/commons/attachment/' + id + '.gson',
            		params: {
            			_method: 'delete'
            		},
            		success: function(response) {
            			var value = Ext.decode(response.responseText);
            			if(value['success']) {
            				attachmentGrid.store.remove(record);
            			}
            		}
            	});
            }
        }]
	}],
	listeners: {
		itemdblclick: function(view, record) {
			//window.location = '${request.contextPath}/commons/down/' + record.get('id');
		}
	}
});

var attachmentTab = {
	itemId: 'attachment',
	title: '流程和附件',
	layout: 'border',
	items: [woFlowPanel,attachmentGrid],
	edit: function(){},
	listeners: {
		activate: function() {
			if(App.currentId) {
				woFlowStore.removeAll();
				attachmentStore.removeAll();
				Ext.Ajax.request({
					url: '${request.contextPath}/commons/attachment/' + App.currentId + '.gson?type=customer',
					success: function(response) {
						var result = Ext.decode(response.responseText);
						if(result.success) {
							attachmentStore.loadData(result['attachments']);
							if(!Ext.isEmpty(result['woflows']))
								woFlowStore.loadData(result['woflows']);
						}else {
							Ext.MessageBox.alert("提醒", "没有记录");
						}
					}
				});
			}
	    }
	}
	
};
