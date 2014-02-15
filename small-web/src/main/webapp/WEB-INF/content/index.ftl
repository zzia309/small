<#include "commons/directives.ftl">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<@myhead/>
<script type="text/javascript" src="${request.contextPath}/statics/model/User.js"></script>
<link rel="stylesheet" type="text/css" href="${request.contextPath}/statics/style/style.css"/>
<title>融悦汽车担保</title>
<head>
<body>
<script type="text/javascript">
	Ext.onReady(function() {
		<#include "porlets/businesscount.ftl">
		<#include "porlets/profitcount.ftl">
		<#include "porlets/sales.ftl">				
		<@initlayout />
	Ext.create('Ext.panel.Panel', {
		id: 'mainContent',
		autoScroll: true,
		layout: 'column',
		items: [bussinesscountchart, profitcountchart, salesPanel]
	});

		//App.createContentPanel({
		//	tabs: [chart]
		//});
		<@dolayout/>
	});
</script>
</body>

</html>