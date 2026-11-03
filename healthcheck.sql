-- Read-only Oracle diagnostic queries. Requires access to the selected views.
SET PAGESIZE 100
SET LINESIZE 220
SET FEEDBACK ON
PROMPT === INSTANCE AND DATABASE ===
SELECT instance_name, host_name, status, startup_time FROM v$instance;
SELECT name, open_mode, database_role, log_mode FROM v$database;

PROMPT === ALLOCATED TABLESPACE SPACE (MB) ===
WITH allocated AS (
 SELECT tablespace_name, SUM(bytes) bytes FROM dba_data_files GROUP BY tablespace_name
), free_space AS (
 SELECT tablespace_name, SUM(bytes) bytes FROM dba_free_space GROUP BY tablespace_name
)
SELECT a.tablespace_name,
 ROUND(a.bytes/1048576,2) allocated_mb,
 ROUND(NVL(f.bytes,0)/1048576,2) free_mb,
 ROUND(100*(a.bytes-NVL(f.bytes,0))/NULLIF(a.bytes,0),2) allocated_used_pct
FROM allocated a LEFT JOIN free_space f ON f.tablespace_name=a.tablespace_name
ORDER BY allocated_used_pct DESC;

PROMPT === USER SESSIONS BY STATUS ===
SELECT status, COUNT(*) session_count FROM v$session WHERE type='USER' GROUP BY status;
PROMPT === BLOCKED SESSIONS ===
SELECT sid, serial#, username, blocking_session, wait_class, event, seconds_in_wait
FROM v$session WHERE blocking_session IS NOT NULL;
PROMPT === INVALID OBJECTS BY OWNER ===
SELECT owner, object_type, COUNT(*) object_count FROM dba_objects
WHERE status='INVALID' GROUP BY owner, object_type ORDER BY owner, object_type;
PROMPT === RECENT RMAN BACKUP JOBS ===
SELECT session_key, input_type, status, start_time, end_time
FROM v$rman_backup_job_details WHERE start_time >= SYSDATE-7 ORDER BY start_time DESC;
