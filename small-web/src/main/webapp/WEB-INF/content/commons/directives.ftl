<#macro myhead>
	<link rel="stylesheet" type="text/css" href="${request.contextPath}/statics/extjs/resources/css/ext-all.css"/>
	<script type="text/javascript" src="${request.contextPath}/statics/extjs/ext-all-debug.js"></script>
	<script type="text/javascript" src="${request.contextPath}/statics/App.js"></script>
	<script type="text/javascript" src="${request.contextPath}/statics/Date.js"></script>
	<script type="text/javascript" src="${request.contextPath}/statics/DateField.js"></script>
	<script type="text/javascript" src="${request.contextPath}/statics/ComboBox.js"></script>
	<script type="text/javascript" src="${request.contextPath}/statics/layout/default.js"></script>
	<link rel="stylesheet" type="text/css" href="${request.contextPath}/statics/style/style.css"/>
</#macro>

<#macro initlayout>
	var root = Ext.create('Ext.data.TreeStore', {
		root: {
			expanded: true,
			children: [
				<#if action.user?? && (action.user.username=='admin')>
				{ text: "用户信息维护", icon: '${request.contextPath}/statics/style/img/action/user.png',leaf: true, uri: '${request.contextPath}/users/index' },
				</#if>
				<#if action.user?? && (action.user.priority>1)>
				{ text: "担保流程", icon: '${request.contextPath}/statics/style/img/action/flow.png',leaf: true, uri: '${request.contextPath}/businesses/index' },
				</#if>
				<#if action.user?? && (action.user.priority==1)>
				{ text: "担保信息维护", icon: '${request.contextPath}/statics/style/img/action/customer.png',leaf: true, uri: '${request.contextPath}/customers/index' }
				</#if>
			]}
	});
	Eap.layout.Default.createMenu({store: root});
	<#if action.user??>
	Eap.layout.Default.createBanner({username: '${action.user.fullname!""}', 'path':'${request.contextPath}'});
	</#if>
</#macro>

<#macro dolayout>
	Eap.layout.Default.layout();
</#macro>