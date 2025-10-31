# Query Optimization Report – Airbnb Database

## 1. Initial Query Overview

The original query retrieved all bookings, users, properties, and payments using multiple joins and an ORDER BY clause. It was functional but inefficient due to:

- Use of `SELECT *` which fetched unnecessary columns.
- No filtering on booking status, causing large result sets.
- Missing indexes on frequently joined columns (user_id, property_id, booking_id).

---

## 2. Performance Analysis with EXPLAIN ANALYZE

Before optimization, `EXPLAIN ANALYZE` showed:

- Full table scans on Booking and Property tables.
- High execution time due to large join combinations.

---

## 3. Optimization Steps

### Step 1: Add Indexes

Created indexes on key join/filter columns:
```sql
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
```

### Step 2: Reduce Data Early

Added a `WHERE b.status = 'confirmed'` clause to reduce the number of rows joined.

### Step 3: Select Only Needed Columns

Replaced `SELECT *` with specific columns to minimize memory and I/O cost.

### Step 4: Reorder Joins

Kept smaller tables or filtered ones earlier in the join order for faster lookups.

---

## 4. Results

After optimization:

- Query execution time reduced significantly (as observed in EXPLAIN ANALYZE output).
- Indexes eliminated full table scans.
- Output remained correct but fetched faster and used fewer resources.

---

## 5. Conclusion

The optimized query is more efficient due to:

- Effective indexing.
- Reduced dataset with filtering.
- Explicit column selection and simplified join operations.

These techniques ensure better scalability as the Airbnb database grows.