# Oracle Operations Toolkit

A read-only diagnostic toolkit and operations runbook by Morteza Rajabi. Portfolio reference material for Oracle database operations; no customer data or credentials are included.

## Files

- `healthcheck.sql`: instance, database, tablespace, session and invalid-object checks
- `backup-validation.md`: backup verification and restore exercise checklist
- `incident-runbook.md`: triage workflow and an evidence template

## Usage

Run in SQL*Plus or SQLcl against an explicitly authorized database:

```sql
@healthcheck.sql
```

The diagnostic queries do not change database configuration. Dynamic performance and DBA views require privileges; ask your DBA for the minimum appropriate read access. Run in the intended CDB/PDB and interpret results in that context. No elevated privileges are granted by these files.

Tablespace figures describe allocated datafiles and free space, not the maximum capacity permitted by autoextend. Session states require contextual interpretation. This is a demonstration toolkit and has not been validated against your production database.
