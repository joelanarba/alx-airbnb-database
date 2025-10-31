# Partition Performance Report

## Before Partitioning

Before applying partitioning, queries filtering by date range had to scan the entire Booking table. This caused slower query execution as data volume increased.

### Query Tested
```sql
EXPLAIN ANALYZE SELECT * FROM Booking WHERE start_date BETWEEN '2024-05-01' AND '2024-05-31';
```

**Observation:** Full table scan, slower response time.

---

## After Partitioning

After partitioning the Booking table by start_date, only the relevant partition is scanned during queries.

### Query Tested
```sql
EXPLAIN ANALYZE SELECT * FROM booking_partitioned WHERE start_date BETWEEN '2024-05-01' AND '2024-05-31';
```

**Observation:** Only the 2024 partition is scanned, resulting in much faster execution time.

---

## Conclusion

Partitioning large tables like Booking improves query performance by limiting the amount of data scanned. This optimization is especially effective when most queries filter data using date ranges.