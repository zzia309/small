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
		<#include "../commons/store.ftl">
		<#include "list.ftl">
		<#include "../commons/woflow.ftl">
		<#include "customer.ftl">
		<#include "business.ftl">
		<#include "attachment.ftl">
		App.createContentPanel({
			tabs: [listTab, businessTab, customerTab, attachmentTab]
		});
		var selection = listgrid.getSelectionModel().getSelection()[0];
		if(!selection) {
			App.getTab("business").setDisabled(true);
			App.getTab("customer").setDisabled(true);
			App.getTab("attachment").setDisabled(true);
		}
		<@dolayout/>
	});
</script>
</body>

</html>