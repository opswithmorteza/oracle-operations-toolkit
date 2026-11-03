# Backup and restore validation

1. Identify the database, role, container, recovery objectives and approved maintenance window.
2. Verify that recent backup jobs completed; investigate partial, failed or unexpectedly absent jobs.
3. Confirm backup and archive log availability in the approved backup system. A successful job status alone is not proof of recoverability.
4. Plan a restore validation on an isolated non-production instance. Record required keys, credentials, storage and recovery point.
5. Use your Oracle-version-specific RMAN documentation and approved procedure. Review commands with the responsible DBA before execution.
6. Perform the isolated restore and application consistency checks. Measure actual recovery duration and achieved recovery point.
7. Document evidence, discrepancies, owners and follow-up dates.

This repository deliberately does not run backup deletion, restore, recovery or retention changes automatically.
