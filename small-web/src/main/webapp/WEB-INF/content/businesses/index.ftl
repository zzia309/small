<#include "../commons/directives.ftl">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<@myhead/>
<script type="text/javascript" src="${request.contextPath}/statics/model/Business.js"></script>
<script type="text/javascript" src="${request.contextPath}/statics/FileField.js"></script>
<link rel="stylesheet" type="text/css" href="${request.contextPath}/statics/style/style.css"/>
<title>客户信息维护</title>
<head>
<body>
<script type="text/javascript">
	Ext.onReady(function() {
		<@initlayout/>
		var genderStore = Ext.create('Ext.data.Store', {
			fields: ['id', 'value'],
			data:[{
				'id': 'M', 'value': '男'
			},{
				'id': 'G', 'value': '女'
			}]
		});
		<#include "list.ftl">
		<#include "woflow.ftl">
		<#include "customer.ftl">
		<#include "business.ftl">
		<#include "attachment.ftl">
		App.createContentPanel({
			tabs: [listTab, businessTab, customerTab, attachmentTab]
		});
		<@dolayout/>
	});
</script>
</body>

</html>