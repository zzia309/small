<#include "commons/directives.ftl">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<@myhead />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录</title>
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
				width: 600,
				height: 60,
				bodyPadding: '0 10 0 10',
				frame: true,
				baseCls: 'background-color:#FFFFFF',
	    		layout: 'column',
				defaults: {
					xtype: 'textfield',
					labelAlign: 'right',
					labelWidth: 50,
					columnWidth: 0.43,
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
	    		},{
	    			xtype: 'button',
	    			text: '登陆',
	    			columnWidth: 0.14,
	    			margin: '5 0 2 4',
	    			handler: function(){
	    				var form = this.up('form').getForm();
	    				console.log(this.up('form').xtype);
	    				if(form.isValid())
	    					form.submit();
	    			}
	    		}],
	    		/*
	    		buttons: [{
	    			text: '登录',
	    			handler: function(){
	    				var form = this.up('form').getForm();
	    				if(form.isValid())
	    					form.submit();
	    			}
	    		}],
	    		*/
				listeners: {
					afterrender: function(form) {
						form.down('field[name=username]').focus(true);
					}
				}
	    	});
	    });
	</script>
	<div id="login1"><div id="login2"></div></div>
</body>
</html>

