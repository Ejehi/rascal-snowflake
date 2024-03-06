create task t as call sp1();
create or replace task public.t USER_TASK_MANAGED_INITIAL_WAREHOUSE_SIZE = 'XSMALL' as call sp1();
create or replace task public.t USER_TASK_MANAGED_INITIAL_WAREHOUSE_SIZE = MEDIUM as call sp1();
create or replace task public.t SCHEDULE = 'USING CRON 5/40 7-19 * * 1-5 Europe/Paris' as call sp1();
CREATE TASK t1 SCHEDULE = 'USING CRON 0 9-17 * * SUN America/Los_Angeles' USER_TASK_MANAGED_INITIAL_WAREHOUSE_SIZE = 'XSMALL' AS SELECT CURRENT_TIMESTAMP;
CREATE TASK mytask_hour WAREHOUSE = mywh  SCHEDULE = 'USING CRON 0 9-17 * * SUN America/Los_Angeles' AS SELECT CURRENT_TIMESTAMP;
CREATE TASK t1 SCHEDULE = '60 MINUTE' TIMESTAMP_INPUT_FORMAT = 'YYYY-MM-DD HH24' USER_TASK_MANAGED_INITIAL_WAREHOUSE_SIZE = 'XSMALL' AS INSERT INTO mytable(ts) VALUES(CURRENT_TIMESTAMP);
CREATE TASK mytask1 WAREHOUSE = mywh SCHEDULE = '5 minute' WHEN SYSTEM$STREAM_HAS_DATA('MYSTREAM') AS  INSERT INTO mytable1(id,name) SELECT id, name FROM mystream WHERE METADATA$ACTION = 'INSERT';
CREATE TASK task5 AFTER task2, task3, task4 AS INSERT INTO t1(ts) VALUES(CURRENT_TIMESTAMP);