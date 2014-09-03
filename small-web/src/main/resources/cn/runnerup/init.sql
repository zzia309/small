insert into sp_users(usr_username, usr_password, usr_priority, usr_gender, usr_fullname)values('admin', '356a192b7913b04c54574d18c28d46e6395428ab', 1, 'M', '业务员');
insert into sp_users(usr_username, usr_password, usr_priority, usr_gender, usr_fullname)values('111', '356a192b7913b04c54574d18c28d46e6395428ab', 2, 'M', '征信人员');
insert into sp_users(usr_username, usr_password, usr_priority, usr_gender, usr_fullname)values('222', '356a192b7913b04c54574d18c28d46e6395428ab', 3, 'M', '初审');
insert into sp_users(usr_username, usr_password, usr_priority, usr_gender, usr_fullname)values('333', '356a192b7913b04c54574d18c28d46e6395428ab', 4, 'M', '终审');
insert into sp_users(usr_username, usr_password, usr_priority, usr_gender, usr_fullname)values('444', '356a192b7913b04c54574d18c28d46e6395428ab', 5, 'M', '老板');
insert into sp_users(usr_username, usr_password, usr_priority, usr_gender, usr_fullname)values('555', '356a192b7913b04c54574d18c28d46e6395428ab', 6, 'M', '财务');
insert into sp_users(usr_username, usr_password, usr_priority, usr_gender, usr_fullname)values('666', '356a192b7913b04c54574d18c28d46e6395428ab', 7, 'M', '后勤');
insert into sp_users(usr_username, usr_password, usr_priority, usr_gender, usr_fullname)values('777', '356a192b7913b04c54574d18c28d46e6395428ab', 8, 'M', '存档专员');

insert into sp_flowauthorizations(fa_role, fa_fromStatus, fa_toStatus)values(1, '-', 'new');
insert into sp_flowauthorizations(fa_role, fa_fromStatus, fa_toStatus)values(2, 'new', '-');
insert into sp_flowauthorizations(fa_role, fa_fromStatus, fa_toStatus)values(2, 'new', 'trial');
insert into sp_flowauthorizations(fa_role, fa_fromStatus, fa_toStatus)values(3, 'trial', '-');
insert into sp_flowauthorizations(fa_role, fa_fromStatus, fa_toStatus)values(3, 'trial', 'final');
insert into sp_flowauthorizations(fa_role, fa_fromStatus, fa_toStatus)values(4, 'final', '-');
insert into sp_flowauthorizations(fa_role, fa_fromStatus, fa_toStatus)values(4, 'final', 'boss');
insert into sp_flowauthorizations(fa_role, fa_fromStatus, fa_toStatus)values(5, 'boss', '-');
insert into sp_flowauthorizations(fa_role, fa_fromStatus, fa_toStatus)values(5, 'boss', 'finance');
insert into sp_flowauthorizations(fa_role, fa_fromStatus, fa_toStatus)values(6, 'finance', 'logistics');
insert into sp_flowauthorizations(fa_role, fa_fromStatus, fa_toStatus)values(7, 'logistics', 'cundang');
insert into sp_flowauthorizations(fa_role, fa_fromStatus, fa_toStatus)values(8, 'cundang', 'closed');


insert into sp_codes (cod_type, cod_name, cod_code, cod_created) values ('BANK_STORE', '浙江泰隆商业银行(融悦)', '浙江泰隆商业银行(融悦)', '2014-01-03 12:05:53');
insert into sp_codes (cod_type, cod_name, cod_code, cod_created) values ('BANK_STORE', '杭州银行清泰支行(融悦)', '杭州银行清泰支行(融悦)', '2014-01-03 12:05:53');
insert into sp_codes (cod_type, cod_name, cod_code, cod_created) values ('BANK_STORE', '杭州银行清泰支行(易顺)', '杭州银行清泰支行(易顺)', '2014-01-03 12:05:53');
insert into sp_codes (cod_type, cod_name, cod_code, cod_created) values ('BANK_STORE', '浙江泰隆商业银行(樊郡波)', '浙江泰隆商业银行(樊郡波)', '2014-01-03 12:05:53');

insert into sp_codes (cod_type, cod_name, cod_code, cod_created) values ('CAR_TYPE_STORE', '新车卡分期', '新车卡分期', '2014-01-03 12:05:53');
insert into sp_codes (cod_type, cod_name, cod_code, cod_created) values ('CAR_TYPE_STORE', '新车普通', '新车普通', '2014-01-03 12:05:53');
insert into sp_codes (cod_type, cod_name, cod_code, cod_created) values ('CAR_TYPE_STORE', '二手车', '二手车', '2014-01-03 12:05:53');
insert into sp_codes (cod_type, cod_name, cod_code, cod_created) values ('CAR_TYPE_STORE', '存量车', '存量车', '2014-01-03 12:05:53');
insert into sp_codes (cod_type, cod_name, cod_code, cod_created) values ('CAR_TYPE_STORE', '公牌', '公牌', '2014-01-03 12:05:53');
insert into sp_codes (cod_type, cod_name, cod_code, cod_created) values ('CAR_TYPE_STORE', '货车', '货车', '2014-01-03 12:05:53');
insert into sp_codes (cod_type, cod_name, cod_code, cod_created) values ('CAR_TYPE_STORE', '租赁零首付', '租赁零首付', '2014-01-03 12:05:53');
insert into sp_codes (cod_type, cod_name, cod_code, cod_created) values ('CAR_TYPE_STORE', '租赁', '租赁', '2014-01-03 12:05:53');
insert into sp_codes (cod_type, cod_name, cod_code, cod_created) values ('CAR_TYPE_STORE', '租赁二手车', '租赁二手车', '2014-01-03 12:05:53');
insert into sp_codes (cod_type, cod_name, cod_code, cod_created) values ('CAR_TYPE_STORE', '其他', '其他', '2014-01-03 12:05:53');