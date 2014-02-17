var carStore = Ext.create('Ext.data.Store', {
	fields:['name','code'],
	data:[<#list action.getCodes('CAR_TYPE_STORE')![] as bank>
			{'code': '${bank.code!?js_string}',
			'name': '${bank.name!?js_string}'
			}<#if bank_has_next>,</#if>
		</#list>]
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
	  {name: '浙江泰隆商业银行(樊郡波)', code: '浙江泰隆商业银行(樊郡波)'}
	]
});


var flowStore = Ext.create('Ext.data.Store', {
	fields:['name','code'],
	data: [
	  {name: '新建', code: 'new'},
	  {name: '初审', code: 'trial'},
	  {name: '终审', code: 'final'},
	  {name: '老板过件', code:'boss'},
	  {name: '财务', code: 'finance'},
	  {name: '后勤', code: 'logistics'},
	  {name: '关闭', code: 'closed'},
	  {name: '驳回', code: '-'}
	]
});