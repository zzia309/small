<#macro myhead>
	<link rel="stylesheet" type="text/css" href="${request.contextPath}/statics/extjs/resources/css/ext-all.css"/>
	<script type="text/javascript" src="${request.contextPath}/statics/extjs/ext-all-debug.js"></script>
	<script type="text/javascript" src="${request.contextPath}/statics/App.js"></script>
	<script type="text/javascript" src="${request.contextPath}/statics/Date.js"></script>
	<script type="text/javascript" src="${request.contextPath}/statics/DateField.js"></script>
	<script type="text/javascript" src="${request.contextPath}/statics/ComboBox.js"></script>
	<script type="text/javascript" src="${request.contextPath}/statics/layout/default.js"></script>
	<link rel="stylesheet" type="text/css" href="${request.contextPath}/statics/style/style.css"/>
	<link rel="stylesheet" type="text/css" href="${request.contextPath}/statics/style/login.css"/>
</#macro>

<#macro initlayout>

	var genderStore = Ext.create('Ext.data.Store', {
		fields: ['id', 'value'],
		data:[{
			'id': 'M', 'value': '男'
		},{
			'id': 'G', 'value': '女'
		}]
	});

	var root = Ext.create('Ext.data.TreeStore', {
		root: {
			expanded: true,
			children: [
				<#if action.user?? && (action.user.username=='admin')>
				{ text: "用户信息维护", icon: '${request.contextPath}/statics/style/img/action/user.png',leaf: true, uri: '${request.contextPath}/users/index' },
				{ text: "基本信息维护", icon: '${request.contextPath}/statics/style/img/action/user.png',leaf: true, uri: '${request.contextPath}/codes/index' },
				</#if>
				<#if action.user?? && (action.user.priority>1)>
				{ text: "担保流程", icon: '${request.contextPath}/statics/style/img/action/flow.png',leaf: true, uri: '${request.contextPath}/businesses/index' },
				{ text: "担保流程查看", icon: '${request.contextPath}/statics/style/img/action/flow.png',leaf: true, uri: '${request.contextPath}/businesses/checks/index' },
				</#if>
				<#if action.user?? && (action.user.priority==1)>
				{ text: "担保信息维护", icon: '${request.contextPath}/statics/style/img/action/customer.png',leaf: true, uri: '${request.contextPath}/customers/index' }
				</#if>
				<#if action.user?? && (action.user.priority>3)>
				{ text: "担保客户信息查询", icon: '${request.contextPath}/statics/style/img/action/customer.png',leaf: true, uri: '${request.contextPath}/checkcustomers/index' }
				</#if>
			]}
	});
	Eap.layout.Default.createMenu({store: root});
	<#if action.user??>
	Eap.layout.Default.createBanner({username: '${action.user.fullname!""}', 'path': '${request.contextPath}', 'id': '${action.user.id!""}'});
	</#if>
</#macro>

<#macro dolayout>
	Eap.layout.Default.layout();
</#macro>