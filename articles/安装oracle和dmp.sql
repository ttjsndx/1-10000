������װ��
1.��װoracle11g �����
2.��װoracle11g �ͻ���  plsql��64λ��ͻ ��װinstantclient
3.������ռ�SHMC3��20G�����û�SHMC3_DB����dmp
4.��window  telnet�������װ�������ͬ��
5.����dmp��������������洢���̡���ͼ������


Զ��linux��װ��
1��telnet  192.168.0.225  �û�����root  hxpti   ���룺hxdb225  123456 shmc3_db (secureCRT����225 oracle,oracle)
2���ϴ�dmpĿ¼����Ŀ¼����/software   
3���½��û�SHMCPM_DEV_01(��ɾ��ԭ���� ��shmc3_sj(shmc3_sj_test)���½�)
4����dmp�ļ�����Ȩ�� chmod 777 /data/oracle/app/oracle/admin/shkf11g/dpdump/shmc3_db.dmp
5��su - oracle  ���л���oracle�û�����ִ�У�
6��echo $ORACLE_SID (��oracle�û����� �鿴��ǰ���ݿ�id)
7��export ORACLE_SID=shkf11g(���õ������ݿ�shcs)
8��impdp SHMCPM_DEV_01/SHMCPM_DEV_01 DIRECTORY='DATA_PUMP_DIR' DUMPFILE=shmc3_db.dmp REMAP_SCHEMA=shmc3_db:SHMCPM_DEV_01��secureCRT��ִ�У�


��أ�
SELECT * FROM Dba_Directories;--�ļ��ж���
select job_name,state from dba_datapump_jobs;--����dmp״̬

������ռ䣺
CREATE TABLESPACE SHMC3 DATAFILE 'D:\project\SHMC301.dbf' SIZE 500M;  

GRANT READ,WRITE ON DIRECTORY LOG_FILE_DIR TO SHMC3_DB;

impdp SHMC3_DB/SHMC3_DB DIRECTORY='LOG_FILE_DIR' DUMPFILE=shmc3_db.dmp

�½��û�SHMC3_DB��Ȩ:
-- Grant/Revoke role privileges 
grant connect to SHMC3_DB;
grant resource to SHMC3_DB;
-- Grant/Revoke system privileges 
grant alter session to SHMC3_DB;
grant create cluster to SHMC3_DB;
grant create database link to SHMC3_DB;
grant create materialized view to SHMC3_DB;
grant create sequence to SHMC3_DB;
grant create session to SHMC3_DB;
grant create synonym to SHMC3_DB;
grant create table to SHMC3_DB;
grant create view to SHMC3_DB;
grant debug any procedure to SHMC3_DB;
grant debug connect session to SHMC3_DB;
grant unlimited tablespace to SHMC3_DB;
grant dba to shmc3_dbtest;


--����ĸ�Ȩ
GRANT ALL ON V_SH_PROJECT_SCHEDULE TO SHMCPM_DEV_01 ;--�ڵ�����⸳Ȩ��Ͷ�ʿ�����
GRANT ALL ON V_DAI_BAN_INFO TO SHMCPM_DEV_01 ;
GRANT ALL ON V_SH_PROJECT_STATES_NEW TO SHMCPM_CS_01 ;
GRANT ALL ON V_SH_PROJECT_STATES TO SHMCPM_CS_01 ;
GRANT ALL ON V_SH_END_START_APPLY TO SHMCPM_CS_01 ;
GRANT ALL ON V_PROJECT_HIDE_INFO TO SHMCPM_CS_01 ;
GRANT ALL ON V_SH_PROJECT_STATES_APP TO SHMCPM_CS_01 ;

CREATE OR REPLACE VIEW  V_SH_PROJECT_SCHEDULE_PMS  AS SELECT * FROM shpdems_v_01.V_SH_PROJECT_SCHEDULE;--��Ͷ�ʿ�����create
CREATE OR REPLACE VIEW  V_DAI_BAN  AS SELECT * FROM shpdems_v_01.V_DAI_BAN_INFO;
CREATE OR REPLACE VIEW  V_SH_PROJECT_STATES_NEW_PMS  AS SELECT * FROM shpdems_v_01.V_SH_PROJECT_STATES_NEW;--��Ͷ�ʿ�����create
CREATE OR REPLACE VIEW  V_SH_PROJECT_STATES_PMS  AS SELECT * FROM shpdems_v_01.V_SH_PROJECT_STATES;--��Ͷ�ʿ�����create
CREATE OR REPLACE VIEW  V_SH_END_START_APPLY_PMS  AS SELECT * FROM shpdems_v_01.V_SH_END_START_APPLY;--��Ͷ�ʿ�����create
CREATE OR REPLACE VIEW  V_PROJECT_HIDE_INFO_PMS  AS SELECT * FROM shpdems_v_01.V_PROJECT_HIDE_INFO;--��Ͷ�ʿ�����create
DROP MATERIALIZED VIEW V_SH_PROJECT_STATES_APP_PMS;
CREATE MATERIALIZED VIEW V_SH_PROJECT_STATES_APP_PMS
REFRESH FORCE ON DEMAND
AS
SELECT * FROM shpdems_v_01.V_SH_PROJECT_STATES_APP;
2.8�ĽŲ�����
