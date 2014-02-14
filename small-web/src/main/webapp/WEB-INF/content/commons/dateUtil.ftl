function DateProcess () {
	var now = new Date();
	this.nowYear =  now.getFullYear(); //当前年
	this.nowMonth = now.getMonth();    //当前月
	this.nowDay = now.getDate();       //当前天
}
DateProcess.prototype = {
	constructor:DateProcess,
	getCurrentMonthStartDate: function(){//获得本月的开始日期 /也是上月的结束日期
		var monthStartDate = new Date(this.nowYear, this.nowMonth, 1);
		return this.getParamsDate(monthStartDate);
	},
	getCurrentMonthEndDate: function(){//获得本月的结束日期
		var nextMonth = this.nowMonth+1;
		var nextYear = this.nowYear;
		if(this.nowMonth==12){
			nextYear = this.nowYear +1;
			nextMonth=1
		}
		var monthEndDate = new Date(nextYear, nextMonth, 1);
		return this.getParamsDate(monthEndDate);

	},
	getLastMonthStartDate:function(){//获得上月的开始日期
		var lastMonth = this.nowMonth-1;
		var lastYear = this.nowYear;
		if(this.nowMonth == 1){
			lastYear= this.nowYear-1;
			lastMonth = 12;
		}
		var lastMonthStartDate = new Date(lastYear, lastMonth, 1);
		return this.getParamsDate(lastMonthStartDate);
	},
	getCurrentYearStart:function(){//获得今年的开始日期
		var currentYearStartDate = new Date(this.nowYear, 0, 1);
		return this.getParamsDate(currentYearStartDate);
	},
	getCurrentYearEnd:function(){//获得今年的结束日期
		var currentYearEndDate = new Date(this.nowYear+1, 0, 1);
		return this.getParamsDate(currentYearEndDate);
	},
	getCurrentDayStart:function(){//获得今天的开始时间/也就是昨天的结束时间
		var currentDayStart = new Date(this.nowYear,this.nowMonth,this.nowDay);
		return this.getParamsDate(currentDayStart);
	},
	getCurrentDayEnd:function(){//获得今天的结束时间
		var now = new Date(this.nowYear,this.nowMonth,this.nowDay).getTime();
		var nextDayTime = now+1000*60*60*24;
		return this.getParamsDate(new Date(nextDayTime));
	},
	getYesterdayStart:function (){//获得昨天的开始时间
		var now = new Date(this.nowYear,this.nowMonth,this.nowDay).getTime();
		var yesterdayTime = now-1000*60*60*24;
		return this.getParamsDate(new Date(yesterdayTime));
	},
	getSomeDayEnd: function(date){//获得某一天的结束时间如：2013-01-01 23:59:59
		var endtime = date.getTime() + 1000*60*60*24 - 1000;
		return this.getParamsDate(new Date(endtime));
	},
	getParamsDate: function(date) {
		return Ext.Date.format(new Date(date), 'Y-m-d h:i:s');
	},
	getDate: function(code){
		var o = {};
		var start;
		var end;
		if(code == 'yesterday'){
			start = this.getYesterdayStart();
			end = this.getCurrentDayStart();
		}

		if(code == 'today'){
			start = this.getCurrentDayStart();
			end = this.getCurrentDayEnd();
		}

		if(code == 'thisMonth'){
			start = this.getCurrentMonthStartDate();
			end = this.getCurrentMonthEndDate();
		}

		if(code == 'lastMonth'){
			start = this.getLastMonthStartDate();
			end = this.getCurrentMonthStartDate();
		}

		if(code == 'thisYear'){
			start = this.getCurrentYearStart();
			end = this.getCurrentYearEnd();
		}

		if(!Ext.isEmpty(start) && !Ext.isEmpty(end)){
			o['start'] = start;
			o['end'] = end;
		}

		return o;





	}
};