# BatchCounter

## Purpose
The **Batch Counter** tracks the number of completed production cycles in the bioreactor demo.  
It provides a simple way to monitor throughput, log batch counts for reporting, and feed data to SCADA/HMI dashboards.

## Responsibilities
- Increment the batch count whenever a cycle completes.
- Provide the current batch count to supervisory logic and operator interface.
- Reset the counter when requested (manual reset or scheduled reset).
- Optionally log batch completion timestamps for compliance.

## Inputs
- `Cycle_Complete : BOOL` — signal from TankCycler or PLC_PRG when a batch finishes.
- `Reset_Counter : BOOL` — operator request to reset batch count.

## Outputs
- `Batch_Count : INT` — total number of completed batches.
- `Batch_Logged : BOOL` — flag indicating a batch was logged (optional).
