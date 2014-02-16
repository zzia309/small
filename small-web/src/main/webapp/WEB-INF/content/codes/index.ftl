<#include "../commons/directives.ftl">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<@myhead/>
<script type="text/javascript" src="${request.contextPath}/statics/model/Code.js"></script>
<link rel="stylesheet" type="text/css" href="${request.contextPath}/statics/style/style.css"/>
<title>基本信息维护</title>
<head>
<body>

<script type="text/javascript">
	Ext.onReady(function() {
		<@initlayout/>
		<#include "list.ftl">
		<#include "code.ftl">
		App.createContentPanel({
			tabs: [listTab, codeTab]
		});
		<@dolayout/>
	});
</script>
</body>

</html>