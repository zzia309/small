Ext.define('Model.Business', {
	extend: 'Ext.data.Model',
	fields: [
	    {name: 'id'},
	    {name: 'customer'},
//	    {name: 'customer.loanername'},
//	    {name: 'lendername'},
//	    {name: 'lendersex'},
//	    {name: 'lenderage'},
//	    {name: 'lendercard'},
//	    {name: 'lendertel'},
//	    {name: 'lenderestate'},
//	    {name: 'lenderunit'},
//	    {name: 'lenderunitTel'},
//	    {name: 'lenderarea'},
//
//	    {name: 'matename'},
//	    {name: 'matesex'},
//	    {name: 'mateage'},
//	    {name: 'matecard'},
//	    {name: 'matetel'},
//	    {name: 'mateestate'},
//	    {name: 'mateunit'},
//	    {name: 'mateunittel'},
//	    {name: 'matearea'},
//
//
//	    {name: 'guaranteename'},
//	    {name: 'guaranteesex'},
//	    {name: 'guaranteeage'},
//	    {name: 'guaranteecard'},
//	    {name: 'guaranteetel'},
//	    {name: 'guaranteeestate'},
//	    {name: 'guaranteeunit'},
//	    {name: 'guaranteeunittel'},
//	    {name: 'guaranteearea'},
//
//
//	    {name: 'sales'},
//	    {name: 'manager'},
//	    {name: 'cartype'},
//	    {name: 'years'},
//	    {name: 'bail'},
//	    {name: 'notaryfee'},
//	    {name: 'otherfee'},
//	    {name: 'guaranteefee'},

	    {name: 'credit'},
	    {name: 'publicorder'},
	    {name: 'court'},

	    {name: 'branch'},
	    {name: 'advances'},
	    {name: 'advancedate'},
	    {name: 'loandate'},

	    {name: 'insuranceagent'},
	    {name: 'insurancestart'},
	    {name: 'insuranceend'},
	    {name: 'certificate'},
	    {name: 'isimpawn'},
	    {name: 'issonghang'},

	    {name: 'carmodel'},
	    {name: 'carengine'},
	    {name: 'carframe'},

	    {name: 'status'}
	]
});