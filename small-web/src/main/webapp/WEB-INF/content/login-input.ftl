<#include "commons/directives.ftl">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<@myhead />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>index</title>
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
	    		title: '用户登录',
				url: 'login',
				method: 'POST',
				standardSubmit: true,
	    		height: 200,
	    		width: 300,
	    		layout: {
	    			type: 'hbox',
	    			align: 'middle',
	    			pack: 'center'
	    		},
	    		items: [{
	    			xtype: 'fieldcontainer',
		    		defaults: {
		    			xtype: 'textfield'
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
		    		}]
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
	    	Ext.create('Ext.container.Viewport',{
	    		layout: {
	    			type: 'hbox',
	    			align: 'middle',
	    			pack: 'center'
	    		},
	    		items: panel,
	    		renderTo: Ext.getBody()
	    	});
	    });
	</script>
</head>
<body>
</body>
</html>

