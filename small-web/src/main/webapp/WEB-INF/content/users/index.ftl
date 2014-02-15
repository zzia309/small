<#include "../commons/directives.ftl">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<@myhead/>
<script type="text/javascript" src="${request.contextPath}/statics/model/User.js"></script>
<link rel="stylesheet" type="text/css" href="${request.contextPath}/statics/style/style.css"/>
<title>用户信息维护</title>
<head>
<body>

<script type="text/javascript">
	Ext.onReady(function() {
		<@initlayout />
		var rolestore = Ext.create('Ext.data.Store', {
			fields: ['id', 'value'],
			data:[{
				'id': 1, 'value': '业务员',
			},{
				'id': 2, 'value': '征信人员'
			},{
				'id': 3, 'value': '初审人员'
			},{
				'id': 4, 'value': '终审人员',
			},{
				'id': 5, 'value': '老板',
			},{
				'id': 6, 'value': '财务',
			},{
				'id': 7, 'value': '后勤',
			}]
		});

		<#include "user.ftl">
		<#include "list.ftl">
		App.createContentPanel({
		tabs: [listTab]
		});
		<@dolayout/>
	});
</script>
</body>

</html>