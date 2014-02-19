<#include "commons/directives.ftl">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<@myhead />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>index</title>
</head>
<body id="login-body">
    <script type="text/javascript">
	    Ext.onReady(function(){
			var enterSubmit = function(field, e) {
				if (e.getKey() == e.ENTER) {
					var form = field.up('form').getForm();
					if(form.isValid())
						form.submit();
				}
			};
	    	var panel = Ext.create('Ext.form.Panel',{
				url: 'login',
				method: 'POST',
				renderTo: 'login2',
				standardSubmit: true,
	    		border: 1,
				width: 425,
				height: 185,
				bodyPadding: '0 10 0 10',
				frame: true,
				baseCls: 'background-color:#FFFFFF',
	    		layout: 'column',
				defaults: {
					xtype: 'textfield',
					labelAlign: 'right',
					labelWidth: 100,
					columnWidth: 1,
					margin: '5 0 0 0'
				},
	    		items: [{
	    			fieldLabel: '用户名',
	    			name: 'username',
	    			value: '${username!""}',
	    			allowblank: false,
	    			listeners: {
						specialkey: enterSubmit
					}
	    		},{
	    			fieldLabel: '密码',
	    			inputType: 'password',
	    			name: 'password',
	    			allowblank: false,
	    			listeners: {
						specialkey: enterSubmit
					}
	    		}],
	    		buttons: [{
	    			text: '登录',
	    			handler: function(){
	    				var form = this.up('form').getForm();
	    				if(form.isValid())
	    					form.submit();
	    			}
	    		}],
				listeners: {
					afterrender: function(form) {
						form.down('field[name=username]').focus(true);
					}
				}
	    	});
	    	/*
	    	Ext.create('Ext.container.Viewport',{
	    		layout: {
	    			type: 'hbox',
	    			align: 'middle',
	    			pack: 'center'
	    		},
	    		items: panel,
	    		renderTo: Ext.getBody()
	    	});
	    	*/
	    });
	</script>
	<div id="login1"><div id="login2"></div></div>
</body>
</html>

