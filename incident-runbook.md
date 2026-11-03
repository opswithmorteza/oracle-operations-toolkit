# Oracle incident triage

## Evidence first

Record: incident ID, UTC timestamps, affected database/service, CDB/PDB context, user impact, recent approved changes and alert/log excerpts with secrets removed.

## Read-only triage

1. Confirm scope: one application, one instance or multiple services?
2. Check instance/database status and listener reachability through approved tooling.
3. Review allocated tablespace space, session counts and blocking relationships.
4. Correlate database waits with application latency, CPU, storage and network metrics.
5. Check backup job status and availability before any recovery decision.
6. Escalate with evidence; obtain approval before killing sessions or changing parameters.

## Resolution record

| Field | Evidence |
|---|---|
| Impact and duration | |
| Root cause / contributing factors | |
| Approved change | |
| Validation and rollback decision | |
| Preventive action / owner / due date | |
