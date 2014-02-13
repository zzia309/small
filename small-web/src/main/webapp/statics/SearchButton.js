Ext.define('Ext.button.SearchButton',{
	extend:'Ext.button.Button',
	alias: 'widget.searchbutton',
	cls: 's-btn',
	overCls: 's-btn-over-cls',
	padding: '0 0 2 0',
	flag:false,
	value: '',
	setValue:function(value){
		this.value = value;
	},
	getValue:function(){
		return this.value;
	},
	setFlag:function(flag){
		this.flag = flag;
	},
	getFlag:function(){
		return this.flag;
	},
	handler:function(){
		var me = this;
		var items = me.up('fieldcontainer').items.items;
		for(var i=0;i<items.length;i++){
			var xtype = items[i].getXType();
			if(xtype === "searchbutton" && items[i].id != me.id){
				items[i].getEl().removeCls('s-btn-visited-cls');
				items[i].getEl().removeCls('s-btn-over-cls');
				items[i].setFlag(false);
			}
		}
		if(me.flag){
			me.getEl().removeCls('s-btn-visited-cls');
			me.getEl().removeCls('s-btn-over-cls');
			me.setFlag(false);
		}else {
			me.getEl().addCls('s-btn-visited-cls');
			me.getEl().addCls('s-btn-over-cls');
			me.setFlag(true);
		}
    }
});