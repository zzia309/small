var carStore = Ext.create('Ext.data.Store', {
	fields:['name','code'],
	data:[
	  {name: '新车卡分期', code: '新车卡分期'},
	  {name: '新车普通', code: '新车普通'},
	  {name: '二手车', code: '二手车'},
	  {name: '存量车', code: '存量车'},
	  {name: '公牌', code: '公牌'},
	  {name: '货车', code: '货车'},
	  {name: '租赁零首付', code: '租赁零首付'},
	  {name: '租赁', code: '租赁'},
	  {name: '租赁二手车', code: '租赁二手车'},
	  {name: '其他', code: '其他'}
	]
});

var genderStore = Ext.create('Ext.data.Store', {
	fields: ['id', 'value'],
	data:[{
		'id': 'M', 'value': '男'
	},{
		'id': 'G', 'value': '女'
	}]
});

//已婚，未婚，离异，丧偶
var marryStore = Ext.create('Ext.data.Store', {
	fields:['name','code'],
	data: [
	  {name: '已婚', code: '已婚'},
	  {name: '未婚', code: '未婚'},
	  {name: '离异', code: '离异'},
	  {name: '丧偶', code: '丧偶'}
	]
});


//（浙江泰隆商业银行（融悦），杭州银行清泰支行(融悦)，杭州银行清泰支行(易顺)，
//浙江泰隆商业银行(樊郡等)），

var bankStore = Ext.create('Ext.data.Store', {
	fields:['name','code'],
	data: [
	  {name: '浙江泰隆商业银行(融悦)', code: '浙江泰隆商业银行(融悦)'},
	  {name: '杭州银行清泰支行(融悦)', code: '杭州银行清泰支行(融悦)'},
	  {name: '杭州银行清泰支行(易顺)', code: '杭州银行清泰支行(易顺)'},
	  {name: '浙江泰隆商业银行(樊郡等)', code: '浙江泰隆商业银行(樊郡等)'}
	]
});