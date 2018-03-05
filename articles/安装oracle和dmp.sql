本机安装：
1.安装oracle11g 服务端
2.安装oracle11g 客户端  plsql和64位冲突 加装instantclient
3.建立表空间SHMC3（20G）、用户SHMC3_DB、导dmp
4.打开window  telnet组件，安装步骤大致同下
5.导入dmp后重新批量编译存储过程、视图、方法


远程linux安装：
1、telnet  192.168.0.225  用户名：root  hxpti   密码：hxdb225  123456 shmc3_db (secureCRT链接225 oracle,oracle)
2、上传dmp目录到根目录下面/software   
3、新建用户SHMCPM_DEV_01(先删除原来的 用shmc3_sj(shmc3_sj_test)再新建)
4、给dmp文件设置权限 chmod 777 /data/oracle/app/oracle/admin/shkf11g/dpdump/shmc3_db.dmp
5、su - oracle  （切换到oracle用户下面执行）
6、echo $ORACLE_SID (在oracle用户下面 查看当前数据库id)
7、export ORACLE_SID=shkf11g(设置导入数据库shcs)
8、impdp SHMCPM_DEV_01/SHMCPM_DEV_01 DIRECTORY='DATA_PUMP_DIR' DUMPFILE=shmc3_db.dmp REMAP_SCHEMA=shmc3_db:SHMCPM_DEV_01（secureCRT里执行）


相关：
SELECT * FROM Dba_Directories;--文件夹对象
select job_name,state from dba_datapump_jobs;--导入dmp状态

创建表空间：
CREATE TABLESPACE SHMC3 DATAFILE 'D:\project\SHMC301.dbf' SIZE 500M;  

GRANT READ,WRITE ON DIRECTORY LOG_FILE_DIR TO SHMC3_DB;

impdp SHMC3_DB/SHMC3_DB DIRECTORY='LOG_FILE_DIR' DUMPFILE=shmc3_db.dmp

新建用户SHMC3_DB后赋权:
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


--单项的赋权
GRANT ALL ON V_SH_PROJECT_SCHEDULE TO SHMCPM_DEV_01 ;--在单项开发库赋权给投资开发库
GRANT ALL ON V_DAI_BAN_INFO TO SHMCPM_DEV_01 ;
GRANT ALL ON V_SH_PROJECT_STATES_NEW TO SHMCPM_CS_01 ;
GRANT ALL ON V_SH_PROJECT_STATES TO SHMCPM_CS_01 ;
GRANT ALL ON V_SH_END_START_APPLY TO SHMCPM_CS_01 ;
GRANT ALL ON V_PROJECT_HIDE_INFO TO SHMCPM_CS_01 ;
GRANT ALL ON V_SH_PROJECT_STATES_APP TO SHMCPM_CS_01 ;

CREATE OR REPLACE VIEW  V_SH_PROJECT_SCHEDULE_PMS  AS SELECT * FROM shpdems_v_01.V_SH_PROJECT_SCHEDULE;--在投资开发库create
CREATE OR REPLACE VIEW  V_DAI_BAN  AS SELECT * FROM shpdems_v_01.V_DAI_BAN_INFO;
CREATE OR REPLACE VIEW  V_SH_PROJECT_STATES_NEW_PMS  AS SELECT * FROM shpdems_v_01.V_SH_PROJECT_STATES_NEW;--在投资开发库create
CREATE OR REPLACE VIEW  V_SH_PROJECT_STATES_PMS  AS SELECT * FROM shpdems_v_01.V_SH_PROJECT_STATES;--在投资开发库create
CREATE OR REPLACE VIEW  V_SH_END_START_APPLY_PMS  AS SELECT * FROM shpdems_v_01.V_SH_END_START_APPLY;--在投资开发库create
CREATE OR REPLACE VIEW  V_PROJECT_HIDE_INFO_PMS  AS SELECT * FROM shpdems_v_01.V_PROJECT_HIDE_INFO;--在投资开发库create
DROP MATERIALIZED VIEW V_SH_PROJECT_STATES_APP_PMS;
CREATE MATERIALIZED VIEW V_SH_PROJECT_STATES_APP_PMS
REFRESH FORCE ON DEMAND
AS
SELECT * FROM shpdems_v_01.V_SH_PROJECT_STATES_APP;
2.8的脚步补上
